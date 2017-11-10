# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TypeUser.create(id: TypeUser::ADMIN, name: 'ADMIN')
TypeUser.create(id: TypeUser::CLIENT, name: 'CLIENT')
TypeUser.create(id: TypeUser::VALIDATOR, name: 'VALIDATOR')


Doorkeeper::Application.create(id: OauthApplication::WEB_APP, name: 'AvancExpress-Client', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob')
