from flask import Flask, render_template, request
from flask.ext.script import Manager

app =  Flask(__name__)
manager = Manager(app)

@app.route('/')
def index():
    return 'INDEX'


@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    #si le nom n'est pas dans l'url, on tente de le choper dans le GET
    if name is None:
        name = request.args.get('name', None)
    return render_template('hello.html', name=name)


if __name__ == "__main__":
        manager.run()
