from html.parser import HTMLParser

# https://docs.python.org/3/library/html.parser.html

# Create a custom parser by subclassing HTMLParser
class ImgFinder(HTMLParser):
    def handle_starttag(self, tag, attrs):
        if tag == 'img':
            for attr in attrs:
                if attr[0] == 'src':
                    print(attr[1])

# Create an instance of your custom parser
finder = ImgFinder()

with open('sample.html', 'r') as file:
    finder.feed(file.read())
