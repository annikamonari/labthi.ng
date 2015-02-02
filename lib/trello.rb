require 'curb'

class Trello

  def Trello.create_board(title)
    request = Curl.post(BOARD_URI, {name: title, key: KEY, token: TOKEN})

    response = JSON.parse(request.body)
    id       = response['id']  # Needs to be saved
    url      = response['url'] # Needs to be saved

    request.response_code == 200 and Trello.set_up_board(id)
  end

  def Trello.add_user(email, first_name, last_name, board_id)
    url    = BOARD_URI + "/#{board_id}/members"
    email  = "?email=#{email}"
    name   = "&fullname=#{first_name}%20#{last_name}"

    request = Curl.put(url + email + name + Trello.access)

    request.response_code == 200
  end

  private
    def Trello.set_up_board(board_id)
      url = BOARD_URI + "/#{board_id}/lists"

      request = Curl.get(url + Trello.access.sub('&', '?'))

      lists = JSON.parse(request.body)

      Trello.change_list_name(lists[0]['id'], 'Alan')   and
      Trello.change_list_name(lists[1]['id'], 'Annika') and
      Trello.change_list_name(lists[2]['id'], 'Fares')  and
      Trello.add_list(board_id, 'Labthing')
    end

    def Trello.change_list_name(list_id, name)
      url  = LIST_URI + "/#{list_id}/name"
      name = "?value=#{name}"

      request = Curl.put(url + name + Trello.access)

      request.response_code == 200
    end

    def Trello.add_list(board_id, name)
      request = Curl.post(LIST_URI, {name: name, idBoard: board_id, 
                                     key: KEY, token: TOKEN})

      request.response_code == 200
    end

    def Trello.access
      "&key=#{KEY}&token=#{TOKEN}"
    end

    KEY   = '082566eccc8f2027b4e720187d909593'
    TOKEN = '35f263805254a85c20d968d3f39a035da46336c61129b3ff4ee4ca5e74368b2f'

    BASE_URI  = 'https://api.trello.com/1/'
    LIST_URI  = BASE_URI + 'lists'
    BOARD_URI = BASE_URI + 'boards'
end