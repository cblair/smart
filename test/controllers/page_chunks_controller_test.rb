require 'test_helper'

class PageChunksControllerTest < ActionController::TestCase
  setup do
    @page_chunk = page_chunks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_chunks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_chunk" do
    assert_difference('PageChunk.count') do
      post :create, page_chunk: { content: @page_chunk.content, name: @page_chunk.name }
    end

    assert_redirected_to page_chunk_path(assigns(:page_chunk))
  end

  test "should show page_chunk" do
    get :show, id: @page_chunk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_chunk
    assert_response :success
  end

  test "should update page_chunk" do
    patch :update, id: @page_chunk, page_chunk: { content: @page_chunk.content, name: @page_chunk.name }
    assert_redirected_to page_chunk_path(assigns(:page_chunk))
  end

  test "should destroy page_chunk" do
    assert_difference('PageChunk.count', -1) do
      delete :destroy, id: @page_chunk
    end

    assert_redirected_to page_chunks_path
  end
end
