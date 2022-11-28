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

 You need to open localhost:3000 once before making requests to run pending migrates  
  
