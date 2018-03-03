require 'test_helper'

class LoadDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @load_document = load_documents(:one)
  end

  test "should get index" do
    get load_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_load_document_url
    assert_response :success
  end

  test "should create load_document" do
    assert_difference('LoadDocument.count') do
      post load_documents_url, params: { load_document: { file: @load_document.file, load_id: @load_document.load_id, note: @load_document.note } }
    end

    assert_redirected_to load_document_url(LoadDocument.last)
  end

  test "should show load_document" do
    get load_document_url(@load_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_load_document_url(@load_document)
    assert_response :success
  end

  test "should update load_document" do
    patch load_document_url(@load_document), params: { load_document: { file: @load_document.file, load_id: @load_document.load_id, note: @load_document.note } }
    assert_redirected_to load_document_url(@load_document)
  end

  test "should destroy load_document" do
    assert_difference('LoadDocument.count', -1) do
      delete load_document_url(@load_document)
    end

    assert_redirected_to load_documents_url
  end
end
