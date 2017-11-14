json.clients @clients do |client|
  json.id client.id
  json.name client.name
  json.name_two client.name_two
  json.last_name_two client.last_name_two
  json.rfc client.rfc
  json.curp client.curp
  json.date client.created_at
  json.last_name client.last_name
  json.loan_detail client.client_loan_detail
  json.address client.address_client
end

