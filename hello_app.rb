require 'sinatra'
get '/' do
    "Welcome to the x mas tree generator!"
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