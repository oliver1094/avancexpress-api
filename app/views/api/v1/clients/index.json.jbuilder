json.clients @clients do |client|
  if client.file_clients.length >= 5
    json.id client.id
    json.name client.name
    json.status client.status
    json.val_first client.val_first
    json.val_second client.val_second
    json.val_third client.val_third
    json.val_four client.val_four
    json.user client.user
    json.name_two client.name_two
    json.last_name_two client.last_name_two
    json.rfc client.rfc
    json.curp client.curp
    json.date client.updated_at
    json.birth_date client.birth_date
    json.motive client.motive
    json.last_name client.last_name
    json.telfijo client.telfijo
    json.phone client.phone
    json.monto client.monto
    json.loan_detail client.client_loan_detail
    json.laboral client.client_laboral
    json.personal client.client_personal
    json.files client.file_clients do |file|
      json.id file.id
      json.name file.name_identifier
      json.url file.name_url
    end
  end

end

