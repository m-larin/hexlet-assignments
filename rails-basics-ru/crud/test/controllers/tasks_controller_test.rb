require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'should get index' do
    get tasks_url

    assert_response :success
    assert_select "li/a", "MyString1"
  end

  test 'should show task' do
    get task_url @task

    assert_response :success
    assert_select "p/strong", "MyString1"
  end

  test 'should new task' do
    get new_task_url

    assert_response :success
  end

  test 'should edit task' do
    get edit_task_url @task

    assert_response :success
  end

  test 'should delete task' do
    delete task_url @task

    assert_response :redirect
  end

  test 'should update task' do
    put task_url @task, params: { task: { name: "555",
                                          description: "666",
                                          creator: "777",
                                          performer: "888" } }

    assert_response :success
  end

  test 'should create task' do
    post tasks_url, params: { task: { name: "111",
                                     description: "222",
                                     creator: "333",
                                     performer: "444" } }

    assert_response :redirect
  end
end
