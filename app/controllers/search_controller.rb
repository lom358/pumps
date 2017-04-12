class SearchController < ApplicationController

  def search
    query = params[:query]
    type = params[:type]
    return  render :json => {status:200, responce:'bad params'} unless (query and type)
    query_w = '%'+query+'%'
    column_name = get_column_name_by_type(type)
    cache_key = "#{query}:#{type}"
    cache_result = SearchCache.where(:query=>cache_key).first

    if !cache_result.nil? and cache_result.updated_at - Time.new < 1.day
       return render :json => {status:200, result: JSON.parse(cache_result.result), column_name:column_name}
    end
    result = case type
               when 'pumps'
                 Pump.where(
                       'mark LIKE ? OR supply = ? OR push = ?
                        OR engine = ? OR max_temp_material = ?
                        OR description LIKE ?',
                       query_w, query.to_f, query.to_i,
                        query.to_f, query.to_f, query_w
                 ).where(:show=>true).load
               when 'pumps_category'
                 PumpsCategory.where(
                      'title LIKE ? OR appointment LIKE ?
                      OR manufacturing_options LIKE ? OR operating_conditions LIKE ?
                      OR max_temp_material = ?',
                      query_w, query_w,query_w, query_w, query.to_f
                 ).load
               when 'type_material'
                 TypeMaterial.where('name LIKE ? OR code = ?', query_w, query.to_i).load
               else
                 []
             end
        if cache_result
          update_result_in_cache(cache_result, result)
        elsif
          save_result_in_cache(cache_key, result)
        end
        render :json => {status:200, result: result, column_name:column_name}
  end

  private

  def save_result_in_cache(cache_key, result)
    begin
      cache = SearchCache.new
      cache.query = cache_key
      cache.result = result.to_json
      cache.save
    rescue
      p 'save_result has been problems'
    end
  end

  def update_result_in_cache(cache, data)
    begin
      cache.update({result:data.to_json})
    rescue
      p 'update_result has been problems'
    end
  end

  def get_column_name_by_type(type)
    return Pump.column_names.to_a if type == 'pumps'
    return PumpsCategory.column_names.to_a if type == 'pumps_category'
    return TypeMaterial.column_names.to_a if type == 'type_material'
    []
  end

end