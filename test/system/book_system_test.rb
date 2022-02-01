require "test_helper"
require 'capybara/rails'
require 'capybara/minitest'

class BookSystemTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def setup
    @one = books :_09h
    @two = books :_10h
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  test 'listing all books' do
    sign_in users(:francisco)
    visit books_path
    assert page.has_content? "Agendamentos"
    assert page.has_content? @one.user.full_name
    assert page.has_content? @one.room.name
    assert page.has_content? @one.schedule
    assert page.has_content? @one.book_date_fmt
    assert page.has_content? "Novo Agendamento"
end

  test 'show a book by id' do
    sign_in users(:francisco)
    visit books_path
    click_link "view-#{@one.id}"
    
    assert page.has_content? 'Visualizando Agendamento'
    assert page.has_content? @one.user.full_name

  end

  test 'update a book by id' do
    sign_in users(:admin)
    visit books_path
    click_link "edit-#{@one.id}"
  
    assert page.has_content? 'Editando Agendamento'
    assert_equal find_button('book-save-button').value, "Atualizar Agendamento"
    assert page.has_content? 'Usuário'

    select('17h', from: 'book_schedule')

    click_on "Atualizar Agendamento"

    assert page.has_content? "Agendamento atualizado com sucesso"
    assert page.has_content? "Visualizando Agendamento"

  end

  test 'create new book' do
    sign_in users(:admin)
    visit books_path

    click_on "Novo Agendamento"

    assert page.has_content? 'Novo Agendamento'
    assert_equal find_button('book-save-button').value, "Criar Agendamento"
    assert page.has_content? 'Usuário'
    assert page.has_content? 'Sala'
    
    month_names = I18n.t 'date.month_names'

    dia = Date.tomorrow.day.to_s
    mes = month_names[Date.tomorrow.month]
    ano = Date.tomorrow.year.to_s

    room = rooms :sala1

    select(room.name.to_s, from: 'book_room_id')
    select(dia, from: 'book_book_date_3i')
    select(mes, from: 'book_book_date_2i')
    select(ano, from: 'book_book_date_1i')
    select('17h', from: 'book_schedule')

    click_on "Criar Agendamento"

    assert page.has_content? "Agendamento criado com sucesso"
    assert page.has_content? "Visualizando Agendamento"

  end

  test 'destroy a book' do
    sign_in users(:francisco)
    visit books_path

    click_link "destroy-#{@one.id}"
    
    page.driver.browser.switch_to.alert.accept

    assert page.has_content? 'Agendamento destruido com sucesso'
    
  end

end
