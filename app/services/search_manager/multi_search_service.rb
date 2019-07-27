module SearchManager
    class MultiSearchService < ApplicationService
        attr_reader :search_query
        
        def initialize(search_query)
            @search_query = search_query
        end
      
        def call
            document = PgSearch.multisearch(@search_query).pluck(:searchable_id,:searchable_type)
            result = Hash[ document.group_by(&:last).map{ |k,a| [k,a.map(&:first)] } ]
            response = {authors:[],books:[],reviews:[]}
            result.keys.each do|model|
                result[model].each do|id|
                    model_object = model.constantize.find_by_id(id)
                    response[model.downcase.pluralize.to_sym].push(model_object) if model_object.present?
                end
            end
            return response
        end
    end
end
