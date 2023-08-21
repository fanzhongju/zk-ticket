#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "{
  \"program\": \"aleo_ticket.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkpHtqVWT6fSHgUMNxsuVf7eaR6id2cj7TieKY1Z8CP5rCD\",
      \"address\": \"aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a\"
  },
  \"license\": \"MIT\"
}" > program.json


# create_ticket
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  create_ticket  |         sui         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run create_ticket 7566697field 10u64 100u8 20u64 30u64 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field;

# mint_public
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  mint_public  |         sui           |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run mint_public aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 7566697field 10u64 100u8 20u64 30u64 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field 25u64;

# mint_private
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  mint_private  |         sui           |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run mint_private aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 7566697field 10u64 100u8 20u64 30u64 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field 25u64;


# transfer_public
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_public  |       1           |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    name: 7566697field.private,
    ticket_num: 10u64.private,
    ticket_price: 100u8.private,
    start_time: 20u64.private,
    end_time: 30u64.private,
    ticket_url: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    _nonce: 647022916828294920515936030261645669678385409339222723192273570433323966508group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;


# transfer_private
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_private  |       1           |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_private "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    name: 7566697field.private,
    ticket_num: 10u64.private,
    ticket_price: 100u8.private,
    start_time: 20u64.private,
    end_time: 30u64.private,
    ticket_url: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    _nonce: 647022916828294920515936030261645669678385409339222723192273570433323966508group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;



# transfer_private_to_public
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_private_to_public  |       1           |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_private_to_public "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    name: 7566697field.private,
    ticket_num: 10u64.private,
    ticket_price: 100u8.private,
    start_time: 20u64.private,
    end_time: 30u64.private,
    ticket_url: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    _nonce: 647022916828294920515936030261645669678385409339222723192273570433323966508group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;



# transfer_public_to_private
echo "
###############################################################################
########           -----------------------------------------           ########
########           |  transfer_public_to_private  |       1           |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public_to_private "{
    owner: aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a.private,
    gates: 0u64.private,
    name: 7566697field.private,
    ticket_num: 10u64.private,
    ticket_price: 100u8.private,
    start_time: 20u64.private,
    end_time: 30u64.private,
    ticket_url: 1410441015758891625902009715147341271747846773496812835022414996323727951771field.private,
    _nonce: 647022916828294920515936030261645669678385409339222723192273570433323966508group.public
}" aleo1zeklp6dd8e764spe74xez6f8w27dlua3w7hl4z2uln03re52egpsv46ngg;