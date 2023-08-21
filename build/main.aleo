program aleo_ticket.aleo;

record Ticket:
    owner as address.private;
    gates as u64.private;
    name as field.private;
    ticket_num as u64.private;
    ticket_price as u8.private;
    start_time as u64.private;
    end_time as u64.private;
    ticket_url as field.private;


mapping ticket_num:
	key left as field.public;
	value right as u64.public;


mapping ticket_price:
	key left as field.public;
	value right as u8.public;


mapping start_time:
	key left as field.public;
	value right as u64.public;


mapping end_time:
	key left as field.public;
	value right as u64.public;


mapping ticket_url:
	key left as field.public;
	value right as field.public;

function create_ticket:
    input r0 as field.public;
    input r1 as u64.public;
    input r2 as u8.public;
    input r3 as u64.public;
    input r4 as u64.public;
    input r5 as field.public;
    gt r1 0u64 into r6;
    assert.eq r6 true;

    finalize r0 r1 r2 r3 r4 r5;

finalize create_ticket:
    input r0 as field.public;
    input r1 as u64.public;
    input r2 as u8.public;
    input r3 as u64.public;
    input r4 as u64.public;
    input r5 as field.public;
    set r1 into ticket_num[r0];
    set r2 into ticket_price[r0];
    set r3 into start_time[r0];
    set r4 into end_time[r0];
    set r5 into ticket_url[r0];


function mint_public:
    input r0 as address.public;
    input r1 as field.public;
    input r2 as u64.public;
    input r3 as u8.public;
    input r4 as u64.public;
    input r5 as u64.public;
    input r6 as field.public;
    input r7 as u64.private;
    lt r4 r7 into r8;
    assert.eq r8 true;
    lt r7 r5 into r9;
    assert.eq r9 true;
    cast r0 0u64 r1 r2 r3 r4 r5 r6 into r10 as Ticket.record;
    output r10 as Ticket.record;

    finalize r1;

finalize mint_public:
    input r0 as field.public;
    get ticket_num[r0] into r1;
    sub r1 1u64 into r2;
    set r2 into ticket_num[r0];


function mint_private:
    input r0 as address.public;
    input r1 as field.public;
    input r2 as u64.public;
    input r3 as u8.public;
    input r4 as u64.public;
    input r5 as u64.public;
    input r6 as field.public;
    input r7 as u64.private;
    lt r4 r7 into r8;
    assert.eq r8 true;
    lt r7 r5 into r9;
    assert.eq r9 true;
    cast r0 0u64 r1 r2 r3 r4 r5 r6 into r10 as Ticket.record;
    output r10 as Ticket.record;

    finalize r1;

finalize mint_private:
    input r0 as field.public;
    get ticket_num[r0] into r1;
    sub r1 1u64 into r2;
    set r2 into ticket_num[r0];


function transfer_public:
    input r0 as Ticket.record;
    input r1 as address.public;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.name r0.ticket_num r0.ticket_price r0.start_time r0.end_time r0.ticket_url into r2 as Ticket.record;
    output r2 as Ticket.record;


function transfer_private:
    input r0 as Ticket.record;
    input r1 as address.private;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.name r0.ticket_num r0.ticket_price r0.start_time r0.end_time r0.ticket_url into r2 as Ticket.record;
    output r2 as Ticket.record;


function transfer_private_to_public:
    input r0 as Ticket.record;
    input r1 as address.public;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.name r0.ticket_num r0.ticket_price r0.start_time r0.end_time r0.ticket_url into r2 as Ticket.record;
    output r2 as Ticket.record;


function transfer_public_to_private:
    input r0 as Ticket.record;
    input r1 as address.private;
    assert.eq self.caller r0.owner;
    cast r1 r0.gates r0.name r0.ticket_num r0.ticket_price r0.start_time r0.end_time r0.ticket_url into r2 as Ticket.record;
    output r2 as Ticket.record;
