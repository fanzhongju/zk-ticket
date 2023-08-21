// The 'aleo_ticket' program.
program aleo_ticket.aleo {
    record Ticket {
        // The token owner.
        owner: address,
        // The Aleo balance (in gates).
        gates: u64,
        // The token name.
        name: field,
        // The token num.
        ticket_num: u64, 
        // The token price.
        ticket_price: u64, 
        // The token start time.
        start_time: u64, 
        // The token end time.
        end_time: u64, 
        // The token ipfs url.
        ticket_url1: field,
        ticket_url2: field,
        ticket_url3: field,
        ticket_url4: field,
    }

    mapping ticket_num: field => u64;
    mapping ticket_price: field => u64;
    mapping start_time: field => u64;
    mapping end_time: field => u64;
    mapping ticket_url: field => field;

    // The project party creates a ticket
    transition create_ticket(
        public param_name: field,
        public param_ticket_num: u64, 
        public param_ticket_price: u64, 
        public param_start_time: u64, 
        public param_end_time: u64, 
        public param_url: field, 
        )  {
        assert(param_ticket_num > 0u64);
        return then finalize(param_name, param_ticket_num, param_ticket_price, param_start_time, param_end_time, param_url);
    }
    
    finalize create_ticket(
        public param_name: field,
        public param_ticket_num: u64, 
        public param_ticket_price: u64, 
        public param_start_time: u64, 
        public param_end_time: u64, 
        public param_url: field, 
        ) {
        Mapping::set(ticket_num, param_name, param_ticket_num);
        Mapping::set(ticket_price, param_name, param_ticket_price);
        Mapping::set(start_time, param_name, param_start_time);
        Mapping::set(end_time, param_name, param_end_time);
        Mapping::set(ticket_url, param_name, param_url);
    }
    
    /* Mint */
    // The function `mint_public` publicly issues 721 tokens on the network for token recipients.
    transition mint_public (
        public param_receiver: address,
        public param_name: field,
        public param_ticket_num: u64, 
        public param_ticket_price: u64, 
        public param_start_time: u64, 
        public param_end_time: u64, 
        public param_url1: field, 
        public param_url2: field, 
        public param_url3: field, 
        public param_url4: field, 
        param_time: u64) -> Ticket {
        // The time is within the effective ticket sales time
        assert(param_start_time < param_time);
        assert(param_time < param_end_time);

        let new_token: Ticket = Ticket{
            owner: param_receiver,
            gates: 0u64,
            name: param_name,
            ticket_num: param_ticket_num, 
            ticket_price: param_ticket_price, 
            start_time: param_start_time, 
            end_time: param_end_time, 
            ticket_url1: param_url1,
            ticket_url2: param_url2,
            ticket_url3: param_url3,
            ticket_url4: param_url4,
        };

        return new_token then finalize(param_name);
    } 

    finalize mint_public(public param_name: field) {
        let num: u64 = Mapping::get(ticket_num, param_name);
        Mapping::set(ticket_num, param_name, num - 1u64);
    }

    // The function `mint_private` initializes a new record for the receiver containing the token for the specified url.
    transition mint_private (
        param_receiver: address,
        param_name: field,
        param_ticket_num: u64, 
        param_ticket_price: u64, 
        param_start_time: u64, 
        param_end_time: u64, 
        public param_url1: field, 
        public param_url2: field, 
        public param_url3: field, 
        public param_url4: field, 
        param_time: u64 ) -> Ticket {
        assert(param_start_time < param_time);
        assert(param_time < param_end_time);
        let new_token: Ticket = Ticket{
            owner: param_receiver,
            gates: 0u64,
            name: param_name,
            ticket_num: param_ticket_num, 
            ticket_price: param_ticket_price, 
            start_time: param_start_time, 
            end_time: param_end_time, 
            ticket_url1: param_url1,
            ticket_url2: param_url2,
            ticket_url3: param_url3,
            ticket_url4: param_url4,
        };

        return new_token then finalize(param_name);
    }

    finalize mint_private(param_name: field) {
        let num: u64 = Mapping::get(ticket_num, param_name);
        Mapping::set(ticket_num, param_name, num - 1u64);
    }


    /* Transfer */

    transition transfer_public(public sender: Ticket, public receiver: address) -> Ticket {
        assert_eq(self.caller, sender.owner);
        let new_token: Ticket = Ticket{
            owner: receiver,
            gates: sender.gates,
            name: sender.name,
            ticket_num: sender.ticket_num, 
            ticket_price: sender.ticket_price, 
            start_time: sender.start_time, 
            end_time: sender.end_time, 
            ticket_url1: sender.ticket_url1,
            ticket_url2: sender.ticket_url2,
            ticket_url3: sender.ticket_url3,
            ticket_url4: sender.ticket_url4,
        };

        return new_token;
    } 

    transition transfer_private(sender: Ticket, receiver: address) -> Ticket {
        assert_eq(self.caller, sender.owner);
        let new_token: Ticket = Ticket{
            owner: receiver,
            gates: sender.gates,
            name: sender.name,
            ticket_num: sender.ticket_num, 
            ticket_price: sender.ticket_price, 
            start_time: sender.start_time, 
            end_time: sender.end_time, 
            ticket_url1: sender.ticket_url1,
            ticket_url2: sender.ticket_url2,
            ticket_url3: sender.ticket_url3,
            ticket_url4: sender.ticket_url4,
        };
        return new_token;
    }

    transition transfer_private_to_public(sender: Ticket, public receiver: address) -> Ticket {
        assert_eq(self.caller, sender.owner);
        let new_token: Ticket = Ticket{
            owner: receiver,
            gates: sender.gates,
            name: sender.name,
            ticket_num: sender.ticket_num, 
            ticket_price: sender.ticket_price, 
            start_time: sender.start_time, 
            end_time: sender.end_time, 
            ticket_url1: sender.ticket_url1,
            ticket_url2: sender.ticket_url2,
            ticket_url3: sender.ticket_url3,
            ticket_url4: sender.ticket_url4,
        };

        return new_token;
    }

    transition transfer_public_to_private(public sender: Ticket, receiver: address) -> Ticket {
        assert_eq(self.caller, sender.owner);
        let new_token: Ticket = Ticket{
            owner: receiver,
            gates: sender.gates,
            name: sender.name,
            ticket_num: sender.ticket_num, 
            ticket_price: sender.ticket_price, 
            start_time: sender.start_time, 
            end_time: sender.end_time, 
            ticket_url1: sender.ticket_url1,
            ticket_url2: sender.ticket_url2,
            ticket_url3: sender.ticket_url3,
            ticket_url4: sender.ticket_url4,
        };

        return new_token;
    }
    

}
