# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cardiology = Clinic.create({ name: 'Cardiology' })
surgery = Clinic.create({ name: 'Surgery' })
psychiatry = Clinic.create({ name: 'Psychiatry' })

bob = psychiatry.patients.create(name: "Bob Knuth", 
	summary: "Bob was admitted for confusion.  He appeared normal this morning",
	viewable_time: "2015-03-04")

bob.patient_datas.create([{ name: "Blood Pressure", value: "124/82" },
                          { name: "Temperature", value: "102.6", comment: "Uh-oh" },
						  { name: "Heart Rate", value: "68 BPM", comment: "Wow!" }])

mary = psychiatry.patients.create(name: "Mary Geraldo", 
	summary: "Mary was admitted for manic behavior.  Her episode has not improved.",
	viewable_time: "2015-03-06")

mary.patient_datas.create([{ name: "Blood Pressure", value: "124/82" },
                           { name: "Temperature", value: "99.5" },
                           { name: "Heart Rate", value: "104 BPM", comment: "Wow!" }])



cardiology.patients.create(name: "Francis Farken", 
	summary: "Francis was admitted for chest pains.  She is awaiting angioplasty.",
	viewable_time: "2015-03-04")

cardiology.patients.create(name: "Marto Mathilda", 
	summary: "Marto was admitted after a fainting spell.",
	viewable_time: "2015-03-06")

cardiology.patients.create(name: "Peter Pinkerton", 
	summary: "Peter was admitted for atrial fibrillation.  He appeared normal this afternoon.",
	viewable_time: "2015-03-12")

cardiology.patients.create(name: "Christopher Canery", 
	summary: "Christopher was admitted for heart failure.",
	viewable_time: "2015-03-10")

surgery.patients.create(name: "Fred Mathilda", 
	summary: "Fred was admitted after breaking his toe.",
	viewable_time: "2015-03-06")

surgery.patients.create(name: "Jane Pinkerton", 
	summary: "Jane was admitted for a hip replacement.",
	viewable_time: "2015-03-16")

surgery.patients.create(name: "Suzie Canery", 
	summary: "Suzie was admitted for a heart transplant.",
	viewable_time: "2015-03-11")



