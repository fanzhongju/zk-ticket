### zk-ticket

zk-ticket aims to provide a series of services for project parties or web2 publishers to create tickets

#### Download

Clone the source code for the auction example from Github.

#### How to Run
##### Generating Accounts
Go to ``aleo.tools`` to generate new accounts.

The `program.json` file contains a private key and address. This is the account that will be used to sign transactions and is checked for record ownership. When executing programs as different parties, be sure to set the `private_key` and `address` fields in program.json to the appropriate values. See `./run.sh` for an example of how to run the program as different parties.

##### Step 0: create_ticket
Exchange the private key and address of the first project party to create tickets to program.json.
```
{
    "program": "auction.aleo",
    "version": "0.0.0",
    "description": "A sealed bid auction",
    "development": {
        "private_key": "APrivateKey1zkpG9Af9z5Ha4ejVyMCqVFXRKknSm8L1ELEwcc4htk9YhVK",
        "address": "aleo1yzlta2q5h8t0fqe0v6dyh9mtv4aggd53fgzr068jvplqhvqsnvzq7pj2ke"
    },
    "license": "MIT"
}
```
Enter the command with the required parameters
```
leo run create_ticket 7566697field 10u64 100u8 20u64 30u64 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field;
```

##### Step 1:  mint_public
```
leo run mint_public aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 7566697field 10u64 100u8 20u64 30u64 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field 25u64;
```

##### Step 2: mint_private
```
leo run mint_private aleo1t0uer3jgtsgmx5tq6x6f9ecu8tr57rzzfnc2dgmcqldceal0ls9qf6st7a 7566697field 10u64 100u8 20u64 30u64 13298649544522489735317862022990397104084220483917467810694527882671470151026591688175478131field 25u64;
```

##### Step 3: transfer_public
The record here is the record of the last mint
```
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

```

##### Step 4: transfer_private
```
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
```

##### Step 5: transfer_private_to_public
```
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
```
 
##### Step 6: transfer_public_to_private
```
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
```