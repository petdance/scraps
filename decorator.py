def logged(func):
    def wrapper(str):
        print('Logging: ' + str)
        return str;
    return wrapper

def arrowed(func):
    def wrapper(str):
        return '==> ' + str
    return wrapper

@logged
@arrowed
def howdy(name):
    return 'Hi '+name

print(howdy('Andy'))
