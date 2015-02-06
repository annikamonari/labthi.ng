require 'curb'

class Trello

  def Trello.create_board(title)
    request  = Curl.post(BOARD_URI, {name: title, key: KEY, token: TOKEN})
    response = JSON.parse(request.body)

    { success: request.response_code == 200, 
      board_id: response['id'] , url: response['url'] }
  end

  def Trello.set_up_management_board(board_id)
    url = BOARD_URI + "/#{board_id}/lists" 

    # TODO: Not working
    Trello.add_management_lists(board_id, url) and
    Trello.add_management_cards(url)
  end

  def Trello.set_up_brainstorming_board(board_id)
  end

  def Trello.add_user(board_id, email, first_name, last_name)
    url    = BOARD_URI + "/#{board_id}/members"
    email  = "?email=#{email}"
    name   = "&fullname=#{first_name}%20#{last_name}"

    request = Curl.put(url + email + name + Trello.access)

    request.response_code == 200
  end

# =============================================================================
# Helper Methods ==============================================================
# =============================================================================

  private

    KEY   = '082566eccc8f2027b4e720187d909593'
    TOKEN = '35f263805254a85c20d968d3f39a035da46336c61129b3ff4ee4ca5e74368b2f'

    BASE_URI  = 'https://api.trello.com/1/'
    LIST_URI  = BASE_URI + 'lists'
    BOARD_URI = BASE_URI + 'boards'
    CARD_URI  = BASE_URI + 'cards'

    def Trello.add_list(board_id, name)
      request = Curl.post(LIST_URI, {name: name, idBoard: board_id, 
                                     key: KEY, token: TOKEN})

      request.response_code == 200
    end

    def Trello.add_card(list_id, name)
      request = Curl.post(CARD_URI, {name: name, idBoard: board_id,
                                     due: 'null', urlSource: 'null',  
                                     key: KEY, token: TOKEN, idList: list_id})

      request.response_code == 200
    end

    def Trello.add_management_lists(board_id, url)
      request = Curl.get(url + Trello.access.sub('&', '?'))
      lists   = JSON.parse(request.body)

      Trello.change_list_name(lists[0]['id'], 'To Discuss') and
      Trello.change_list_name(lists[1]['id'], 'To Do Plan') and
      Trello.change_list_name(lists[2]['id'], 'To Do Business Plan') and
      Trello.add_list(board_id, 'To Do Design') and
      Trello.add_list(board_id, 'To Do Prototype') and
      Trello.add_list(board_id, 'To Do Other') and
      Trello.add_list(board_id, 'In Process') and
      Trello.add_list(board_id, 'In Review') and
      Trello.add_list(board_id, 'Completed')
    end

    def Trello.add_management_cards(board_id, url)
      request = Curl.get(url + Trello.access.sub('&', '?'))
      lists   = JSON.parse(request.body)

      Trello.add_card(lists[0]['id'], 'Add cards about anything that you need to discuss or brainstorm as a team here. For example: "user demographic breakdown of our customer segment", or: "the functionality we will build for the prototype".') and
      Trello.add_card(lists[1]['id'], 'Add cards about tasks that need to be completed that have to do with the plan component.') and
      Trello.add_card(lists[2]['id'], 'Add cards about tasks that need to be completed that have to do with the business plan component.') and
      Trello.add_card(lists[3]['id'], 'Add cards about tasks that need to be completed that have to do with the design component.') and
      Trello.add_card(lists[4]['id'], 'Add cards about tasks that need to be completed that have to do with the prototype component.') and
      Trello.add_card(lists[5]['id'], 'Add cards about any other tasks that need to be done that do not fall into any of the categories that there are already lists for.') and
      Trello.add_card(lists[6]['id'], 'Drag and drop cards from any of the other lists that correspond to tasks that are currently being worked on.') and
      Trello.add_card(lists[7]['id'], 'Drag and drop cards from the In Process list corresponding to tasks that have been finished but need review. Note that not all tasks may need review; if as a team you agree that they do not need to be reviewed, you can skip this list and put the card into the Completed list.') and
      Trello.add_card(lists[8]['id'], 'Drag and drop cards corresponding to tasks that have been completely finished, reviewed, and ready to ship!') 
    end

    def Trello.change_list_name(list_id, name)
      url  = LIST_URI + "/#{list_id}/name"
      name = "?value=#{name}"

      request = Curl.put(url + name + Trello.access)

      request.response_code == 200
    end

    def Trello.access
      "&key=#{KEY}&token=#{TOKEN}"
    end

end