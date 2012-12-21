package grails.platform.ui.scaffolding

class PlatformUIDemo {


    String userName
    String firstName
    String surname
    Date dateOfBirth
    String emailAddress
    String phoneNumber

    static constraints = {

        userName(empty:false, unique: true)
        firstName()
        surname()
        dateOfBirth()
        emailAddress(empty:false, email: true, unique: true)
        phoneNumber()

    }
}
