# Instabug Chat System API

A backend API for a chat system that allows the creation of multiple chat application
each of which can contain multiple chats which in turn contains multiple messages, moreover, 
the API allow for text search of the chat.

# API

```
# Create new application
curl -X POST -d '{"name": "test"}'  applications/


# Show all aplications
curl -X GET applications

# Create new chat
curl -X POST applications/application_id/chats

# Show chat by ID
curl -X GET -d '{"chat_id": "1"}' applications/application_id/chats

# Create new message
curl -X POST -d '{"content": "hello"}'  applications/application_id/chats/chat_id/messages

# Show messages in chat(by chat_id)
curl -X GET applications/application_id/chats/chat_id/messages


# Search through messages
curl -X GET -d '{"query": "hello"}'  applications/application_id/chats/chat_id/messages/search/

```  

# Dependencies

- Docker
- Docker compose
- Elastic search (network fetched)
- Mysql (network fetched)
- Ruby on rails (network fetched)

# Run

```
docker-compose up
```
# Note
  all funtions that benn required works fine but for some reason the configuration of elastic search file cant built up with docker, so messages model isn't work using   docker-compose up but it works fine using rails server but in this case you need to download elastic search manually, sorry for that i tried to solve it but beacaus   of the deadline was so close so i had to submit, thank you.
  
