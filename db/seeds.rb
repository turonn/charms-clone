teacher = Teacher.create({
  first_name: 'Ginger',
  last_name: 'Girl',
  email_address: 'example@email.com',
  email_verified: true,
  mobile_phone_number: '123-456-7890',
  birthday: '20222-11-03'.to_date
})

program = Program.create({
  id: '123',
  name: 'band',
  description: 'the band program'
})

program_teacher = ProgramTeacher.create({
  program: program,
  teacher: teacher
})

instruments = Instrument.create([
  {
    case_id: "case 1",
    instrument: 'trumpet',
    make: 'Bach',
    model: 'stradivarious',
    serial_number: '123bc34',
    year: 2013,
    condition: 'excellent',
    notes: 'this is an excellent horn',
    program: program
  },
  {
    case_id: "case 2",
    instrument: 'clarinet',
    make: 'Buffet',
    model: 'R13',
    serial_number: 'theserial34',
    year: 2008,
    condition: 'good',
    notes: 'this is an excellent horn',
    program: program
  }
])
