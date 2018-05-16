library(tm)
library(wordcloud)


setwd('/Users/mymacpro/Documents/PROJECTS/Scrapy') 
a  <-Corpus(DirSource("./text")) #specifies the exact folder where my text file(s) is for analysis with tm.
summary(a)  #check what went in
a <- tm_map(a, removeNumbers)
a <- tm_map(a, removePunctuation)
a <- tm_map(a, stripWhitespace)
a <- tm_map(a, tolower)
stopword = c(stopwords("english"),"people","data","together","google","amazon","facebook",
             "apple",'build','world','around','can','small','new','just','one','end','next',
              'microsoft', 'sex','via','vary','qualified','form','find','upon',
             'may','isnt','check','two','googles','age','request','without','best',
             'place','ways','bring','will','high','strong','give','etc','others',
             'hire','day','choice','race','due','see','come','closer','community','helps',
             'company','family','need','pass','required','life','country','success',
             'candidates','depending','learn','inspire','areas','looking','want','share',
             'reach','connect','work','heart','need','changing','centers','billions','make',
             'always','billion','hundreds','whether','millions','job',
             'depending','required','basic','preferred','consideration','help',
             'experience','kind','teams','started','qualifications','information','help',
             'regard','leave','team','connects','status','individuals','various',
             'education','candidate','another','join','key','description','part',
             'facebooks','solutions','technical','protected','disability','medical',
             'years','needs','running','large','color','receive','park','product',
             'operations','origin','employment','highly','care','histories','meet',
             'medium','done','plus','building','gives','disability','opportunity',
             'religion','running','national','applicants','send','roles','goes','full',
             'role','field','closely','including','big','computer','like','related',
             'time','using','across','ability','working','skills','take','drive',
             'users','trends','proud','constantly','apply','awards','development',
             'female','ability','science','problems','scale','also','business','analysis',
             'engineering','deliver','well','range','must','use','lead','solve','develop',
             'management','expert','systems','planning','within','problems','research',
             'projects','create','system','andor','engineers','global','position',
             'menlo','communities','different','results','handle','accommodation',
             'pregnancy','identity','open','nature','applicable','equal','include',
             'please','action','amazoncom','passionate','natural','apples','processing',
             'professional','complex','matters','extend','software','solving','every',
             'able','products','tools','think','understand','design','real','services',
             'ensure','project','quality','critical','get','support','maintain',
             'collaborate','builders','glassdoors','power','expand','helping','reports',
             'ready','equivalent','applications','identify','consider','physical',
             'gender','mental','listed','condition','affiliation','consider','change',
             'foundamentals','language','minority','additional','features','knowledge',
             'get','social','sets','practical','entirely','least','practices','meaningful',
             'opportunityaffirmative','environment','communication','requirements',
             'based','collaborative','clear','enable','improve','human','play','impact',
             'understanding','provide','responsibilities','platform','fast','influence',
             'core','wide','growth','test','industry','edge','great','sales','play',
             'improve','fundamentals','responsible','service','veteran','customer',
             'reasonable','expression','process','largescale','stronger','getting',
             'ideal','ideas','benefits','keep','employees','seeking','risk','based',
             'regulations','thereafter','sexual','customers','orientation','application',
             'ordiances','deeply','assistance','employer','built','minimum','mission',
             'excellent','performance','office','partner','comfortable','vrebal','senior',
             'delivering','problem','legal','recruiting','desire','content','techonology',
             'plan','expertise','techniques','successful','know','online','future',"political",
             "ordinances","criminal","characteristic","considered","scenarios","worlds","empower",
             "used","youll","limited","stay","solution","truly","marital","massive","move","quantitative",
             "familiarity","store","reporting","record","fun","written","methods","iterating",
             "insights","grow","regardless","consistent","demonstrated","workplace","laws",
             "group","value","youre","list","infrastructure","seattle","york","fulltime",
             "asking","offer","storage","program","processes","interested","benefitsperks",
             "collaboration","culture","deep","creating","push","broad","austin","challenges",
             "set","local","call","quickly","technology","better","recommendations","groundbreaking",
             "redefining","technologies","recognition","solid","objectoriented","structures","babs",
             "serve","months","text","pure","described","background","paced","level","levels",
             "top","distributed","manage","area","driving","driven","overall","allow","relevant",
             "making","plans","similar","opportunities","way","advanced","piece","ownership",
             "complexity","crossfunctional")
# remove stop words
a <- tm_map(a, removeWords, stopword)

# create term-document matrix
tdm = TermDocumentMatrix(a)

# convert as matrix
tdm = as.matrix(tdm)

# add column names
colnames(tdm) = c("Amazon", "Apple", "Facebook", "Google", "Microsoft")

# comparison cloud
comparison.cloud(tdm, random.order=FALSE, scale=c(3, 0.5),
                 title.size=1.5, max.words=500)

# commonality cloud
commonality.cloud(tdm, random.order=FALSE, scale=c(3, 1),
                  colors = brewer.pal(8, "Dark2"),
                  title.size=1.5)

