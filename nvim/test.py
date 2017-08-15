class TestClass:
    def __init__(self, **kwargs):
        for kwarg, value in kwargs.items():
            setattr(self, kwarg, value)
    
    def __setattr__(self, value):
        super(TestClass).__setattr__(value)


test = TestClass(kwarg1='test1', kwarg2='test2', kwarg3='test3')

print(test.kwarg1)
print(test.kwarg2)
print(test.kwarg3)
