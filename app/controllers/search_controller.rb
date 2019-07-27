class SearchController < ApplicationController

    def search
        response = SearchManager::MultiSearchService.call(search_params["search_query"])
        render :json=>{message:response}
    end

    private

    def search_params
        params.permit(:search_query)
    end

end
