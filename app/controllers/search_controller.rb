class SearchController < ApplicationController

  def search
    query = params[:query]
    type = params[:type]
    query_w = '%'+query+'%'
    render :json => {status:200, responce:'bad params'} unless query and type
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
        render :json => {status:200, result: result}
  end

end