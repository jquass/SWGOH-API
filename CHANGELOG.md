The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
## Added
- Added methods to make requests to the data endpoint by [@jquass](https://github.com/jquass)
- Added client data endpoint unit tests by [@jquass](https://github.com/jquass)
- Added project param by [@jquass](https://github.com/jquass)
## Changed
- Removed ally_codes param from get_zetas and changed name to zetas by [@jquass](https://github.com/jquass)
- Removed ally_codes param from get_squads and changed name to squads by [@jquass](https://github.com/jquass)
- Removed ally_codes param from get_events and changed name to events by [@jquass](https://github.com/jquass)
- Removed ally_codes param from get_battles and changed name to battles by [@jquass](https://github.com/jquass)
- Renamed get_players to players by [@jquass](https://github.com/jquass)
- Renamed get_guilds to guilds by [@jquass](https://github.com/jquass)
- Renamed get_rosters to rosters by [@jquass](https://github.com/jquass)
- Renamed get_units to units by [@jquass](https://github.com/jquass)

## [0.3.19] - 2020-10-16
## Changed
- Set ally code request header type to json by [@jquass](https://github.com/jquass)
- Add request error logging by [@jquass](https://github.com/jquass)

## [0.3.17] - 2020-10-16
## Changed
- Format ally code request bodies to json by [@jquass](https://github.com/jquass)

## [0.3.15] - 2020-10-16
## Changed
- Fix how ally code request bodies are formatted by [@jquass](https://github.com/jquass)
- Fix CLIENT_REQUESTS_test by [@jquass](https://github.com/jquass)
- Fix API_test by [@jquass](https://github.com/jquass)

## [0.3.12] - 2020-10-16
## Changed
- *Really* use https when making requests to auth/signin by [@jquass](https://github.com/jquass)

## [0.3.11] - 2020-10-16
### Changed
- Fixed bug setting port making ally code requests by [@jquass](https://github.com/jquass)

## [0.3.10] - 2020-10-16
### Changed
- Fixed CLIENT_AUTH_test by [@jquass](https://github.com/jquass)
- Secure requests with ally code by [@jquass](https://github.com/jquass)

## [0.3.8] - 2020-10-15
### Changed
- Use https when making requests to auth/signin by [@jquass](https://github.com/jquass)

## [0.3.7] - 2020-08-22
### Changed
- Updated the README to follow [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) by [@jquass](https://github.com/jquass)

## [0.3.6] - 2020-07-20
### Added
- Unit tests to test client auth by [@jquass](https://github.com/jquass)
- Unit tests to test client requests by [@jquass](https://github.com/jquass) 
- Unit test helper by [@jquass](https://github.com/jquass)
- Updated REAMDE by [@jquass](https://github.com/jquass)

### Changed
- Fixed relative paths on module constants by [@jquass](https://github.com/jquass)

## [0.3.5] - 2020-07-13
### Changed
- Fixed auth field validation by [@jquass](https://github.com/jquass)
- Fix how auth token is stored [@jquass](https://github.com/jquass)

## Legacy CHANGELOG

- v0.3.5 Fix bad imports so it can actually work
- v0.3.4 Add CHANGELOG.md
- v0.3.3 Update README.md and various fixes
- v0.3.0 Make the client a configurable object
