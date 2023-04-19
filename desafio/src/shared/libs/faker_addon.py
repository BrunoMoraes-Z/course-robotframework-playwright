from FakerLibrary import FakerLibrary
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


@keyword(name='Get CPF')
def get_cpf(formatted: bool = False):
    instance: FakerLibrary = BuiltIn().get_library_instance('FakerLibrary')
    cpf = str(instance.cpf())

    if not formatted:
        cpf = cpf.replace('-', '').replace('.', '')

    print(cpf)
    return cpf

@keyword(name='Get Fake Person')
def get_fake_person():
    instance: FakerLibrary = BuiltIn().get_library_instance('FakerLibrary')
    cpf = get_cpf()

    person = {
        'name': f'{instance.first_name()} {instance.last_name()}',
        'password': cpf,
        'email': f'{cpf}@getnada.com',
    }

    print(person)
    return person