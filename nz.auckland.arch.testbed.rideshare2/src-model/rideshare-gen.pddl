(define (problem pb_rideshare)
	(:domain migration)
	(:objects
		payprocesswire - connector
		driverquerywire - connector
		oraclepaywire - connector
		paywire - connector
		driverupdatewire - connector
		ropayprocesswire - connector
		assignwire - connector
		DriverUI - service
		BillingGateway - application
		PaymentBlockchain - datastore
		Payment - service
		TripMgmt - service
		DriverupdatewireCommandLog - datastore
		PassengerUI - application
		AssignwireLog - datastore
		DriverRecord - datastore
		PaymentOracle - service
		Android2 - container
		Android2 - container
		Mobile2 - prvserver
		BankOS - container
		BankOS - container
		BankServer - prvserver
		Ehtereum - database
		BCServerNode - prvserver
		TestEhtereum - testsandbox
		TestDockerContainer3 - testsandbox
		DockerContainer3 - container
		GCloud - cloud
		TestDockerContainer1 - testsandbox
		DockerContainer1 - container
		ConfluentCloud - database
		TestConfluentCloud - testsandbox
		Android1 - container
		Android1 - container
		Mobile1 - prvserver
		TestConfluentCloud - testsandbox
		TestGDataStore - testsandbox
		GDataStore - database
		DockerContainer2 - container
		TestDockerContainer2 - testsandbox
		TestSys - prvserver
	)
	(:init
		(connect payprocesswire BillingGateway Payment)
		(connect driverquerywire TripMgmt DriverRecord)
		(connect oraclepaywire PaymentOracle PaymentBlockchain)
		(connect paywire PassengerUI PaymentOracle)
		(connect driverupdatewire DriverUI DriverRecord)
		(connect driverupdatewire DriverUI DriverupdatewireCommandLog)
		(connect ropayprocesswire Payment PaymentBlockchain)
		(connect assignwire TripMgmt DriverUI)
		(connect assignwire TripMgmt AssignwireLog)
		(in DriverUI Android2)
		(at Android2 Mobile2)
		(at Android2 Mobile2)
		(in BillingGateway BankOS)
		(at BankOS BankServer)
		(at BankOS BankServer)
		(in PaymentBlockchain TestEhtereum)
		(at Ehtereum BCServerNode)
		(at TestEhtereum TestSys)
		(in Payment TestDockerContainer3)
		(at TestDockerContainer3 TestSys)
		(init DockerContainer3)
		(at DockerContainer3 GCloud)
		(in TripMgmt TestDockerContainer1)
		(at TestDockerContainer1 TestSys)
		(init DockerContainer1)
		(at DockerContainer1 GCloud)
		(in DriverupdatewireCommandLog TestConfluentCloud)
		(at ConfluentCloud GCloud)
		(at TestConfluentCloud TestSys)
		(in PassengerUI Android1)
		(at Android1 Mobile1)
		(at Android1 Mobile1)
		(in AssignwireLog TestConfluentCloud)
		(at ConfluentCloud GCloud)
		(at TestConfluentCloud TestSys)
		(in DriverRecord TestGDataStore)
		(at TestGDataStore TestSys)
		(at GDataStore GCloud)
		(in PaymentOracle TestDockerContainer2)
		(init DockerContainer2)
		(at DockerContainer2 GCloud)
		(at TestDockerContainer2 TestSys)
	)
	(:goal (and 
		(netbound BillingGateway Payment)
		(netbound TripMgmt DriverRecord)
		(netbound PaymentOracle PaymentBlockchain)
		(netbound PassengerUI PaymentOracle)
		(netbound DriverUI DriverRecord)
		(netbound DriverUI DriverupdatewireCommandLog)
		(netbound Payment PaymentBlockchain)
		(netbound TripMgmt DriverUI)
		(netbound TripMgmt AssignwireLog)
		(in PaymentBlockchain Ehtereum)
		(in Payment DockerContainer3)
		(in TripMgmt DockerContainer1)
		(in DriverupdatewireCommandLog ConfluentCloud)
		(in AssignwireLog ConfluentCloud)
		(in DriverRecord GDataStore)
		(in PaymentOracle DockerContainer2)
	))
)
