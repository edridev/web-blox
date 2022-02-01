require "test_helper"
require 'capybara/rails'
require 'capybara/minitest'

class RoomSystemTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  
  def setup
    book1 = books :_09h
    book2 = books :_10h
    @one = book1.room
    @two = book2.room
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  test 'listing all rooms' do
    sign_in users(:francisco)
    visit rooms_path
    assert page.has_content? @one.name
    assert page.has_content? @two.name
    assert page.has_content? "Nova Sala"
    assert page.has_content? "Salas"
    assert page.has_content? "Nome da sala"
  end

  test 'show a room by id' do
    sign_in users(:francisco)
    visit rooms_path

    click_link "view-#{@one.id}"
    
    title = @one.books.first.user.full_name
    
    assert page.has_content? 'Visualizando Sala'
    assert page.has_content? 'Dom'
    assert page.has_content? 'Seg'
    assert page.has_content? 'Ter'
    assert page.has_content? 'Qua'
    assert page.has_content? 'Qui'
    assert page.has_content? 'Sex'
    assert page.has_content? 'Sáb'
    assert page.has_content? 'Dom'
    assert page.has_content? 'Dom'
    assert page.has_content? 'Dom'
    assert page.has_content? title

  end

  test 'update a room by id' do
    sign_in users(:francisco)
    visit rooms_path
    assert page.has_content? @one.name

    click_link "edit-#{@one.id}"
    assert page.has_content? 'Editando sala'
    assert_equal find_button('room-save-button').value, "Atualizar Sala"
    assert page.has_content? 'Nome da sala'

    fill_in( 'room_name', with: Faker::Name.name )

    click_on "Atualizar Sala"

    assert page.has_content? "Sala atualizada com sucesso"
    assert page.has_content? "Visualizando Sala"

  end

  test 'create new room' do
    sign_in users(:francisco)
    visit rooms_path
    assert page.has_content? 'Salas'
    assert page.has_content? 'Nova Sala'

    click_on "Nova Sala"

    assert page.has_content? 'Nova Sala'
    assert_equal find_button('room-save-button').value, "Criar Sala"
    assert page.has_content? 'Nome da sala'

    fill_in( 'room_name', with: Faker::Name.name )

    click_on "Criar Sala"

    assert page.has_content? "Sala criada com sucesso"
    assert page.has_content? "Visualizando Sala"

  end

  test 'destroy a room' do
    sign_in users(:francisco)
    visit rooms_path
    assert page.has_content? 'Salas'
    assert page.has_content? 'Nova Sala'

    @one.books.delete_all

    click_link "destroy-#{@one.id}"

    page.driver.browser.switch_to.alert.accept

    assert page.has_content? 'Sala destruida com sucesso'
    
  end


end
