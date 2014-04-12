class PageChunk < ActiveRecord::Base
    belongs_to :page

    def self.find_or_create_by_name_and_page_name(page_chunk_name, page_name)
        page = Page.find_or_create_by(name: page_name)
        page_chunk = PageChunk.find_or_create_by(page_id: page.id, name: page_chunk_name)
        #page_chunk.page = Page.find_or_create_by(name: "") 
    end
end
