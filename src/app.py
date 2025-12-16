from flask import Flask, request, render_template_string

app = Flask(__name__)

@app.route('/greet', methods=['GET'])
def greet_user():
    # Accepting user input directly from query parameters
    user_name = request.args.get('name')

    # Vulnerable to XSS, as input is directly rendered in HTML without sanitization
    html_content = f'''
    <html>
        <body>
            <h1>Hello, {user_name}!</h1>
        </body>
    </html>
    '''
    return render_template_string(html_content)

if __name__ == '__main__':
    app.run(debug=True)
