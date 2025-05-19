require 'sinatra'
get '/' do
    "<style>body {text-align:center}</style>
    <html><head><title>XMAS Tree generator</title></head>
    <body>
    <h1>Welcome to the XMAS tree generator!</h1>
    <p>info: just made very basic version of my xmas tree generator,
    it generates tree base on number after slash e.g.</p
    <br>
    <a href='https://ruby-tutorial-3icp.onrender.com/12'>https://ruby-tutorial-3icp.onrender.com/12</a>
    <br>
    <a href='https://ruby-tutorial-3icp.onrender.com/33'>https://ruby-tutorial-3icp.onrender.com/33</a>
    <br>
    <a href='https://ruby-tutorial-3icp.onrender.com/99'>https://ruby-tutorial-3icp.onrender.com/99</a>
    <br>
    <a href='https://ruby-tutorial-3icp.onrender.com/1001'>https://ruby-tutorial-3icp.onrender.com/1001</a>
</body>
</html>"
end
get '/:level' do
    if params['level'].to_i < 1
        return "Please enter a number greater than 0"
    else
        a = (1..params['level'].to_i+1).to_a.map { |x| x.to_s }
        tree = a.map.with_index { |x, i|  "<span class='no'>i</span>" * i }.map {|x| "<p>#{x}</p>"}

        html_tree= ''
        tree[1..-1].each { |x|
            html_tree << x
        }
        counter = 1
        result = html_tree.gsub('i') { (counter += 1) - 1 }
        return '<style>body {text-align:center} span { padding: 0.4em} p { margin:0 }</style>' + result
    end
end