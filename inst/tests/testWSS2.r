context("Test WSS2")

# Create data
n <- 150 #size of dataset
nyr <- 20 # number of years in data
nSamples <- 20 # set number of dates
set.seed(seed = 125)

# Create somes dates
first <- as.POSIXct(strptime("2003/01/01", "%Y/%m/%d")) 
last <- as.POSIXct(strptime(paste(2003+(nyr-1),"/12/31", sep=''), "%Y/%m/%d")) 
dt <- last-first 
rDates <- first + (runif(nSamples)*dt)

# taxa are set as random letters
taxa <- sample(letters, size = n, TRUE)

# three sites are visited randomly
site <- sample(c('one', 'two', 'three'), size = n, TRUE)

# the date of visit is selected at random from those created earlier
time_period <- sample(rDates, size = n, TRUE)

# combine this to a dataframe
df <- unique(data.frame(taxa, site, time_period))

test_that("Test WSS2", {
 
  results <- WSS2(df$taxa,
                  df$site,
                  df$time_period,
                  minL = 4,
                  minTP = 3) 
  
  expected <- structure(list(species_name = structure(1:24, .Label = c("a", 
                                                                       "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "m", "n", "o", 
                                                                       "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"), class = "factor"), 
                             intercept.estimate = c(-1.17813615841209, -2.12537149340661, 
                                                    -1.69964633229247, -1.51400669031581, -2.17694670870581, 
                                                    -1.33051949786452, -2.81871216623466, -2.64878621157404, 
                                                    -2.83618515608237, -1.57619083577126, -1.91006662549916, 
                                                    -2.81871216623466, -2.13626675520563, -1.77291892148902, 
                                                    -1.28374976649498, -1.71689286382205, -1.18280256698858, 
                                                    -13.8495754516103, -1.17761952653023, -291.923839798309, 
                                                    -1.84414443605511, -1.1987476808411, -0.769632624327203, 
                                                    -2.475926206912), 
                             year.estimate = c(0.0342324501489189, 0.0112167453431509, 
                                              0.0720377568709633, -0.122016362636812, -0.148006283952421, 
                                              0.171895782899429, 0.174123271705114, -0.566460540397709, 
                                              -0.11415650840461, -0.137664655677721, -0.0856616201509247, 
                                              0.174123271705114, -0.25123726518694, 0.11711347726114, -0.0468771833560082, 
                                              0.0864040814080048, 0.0243500035155962, -0.255972184926112, 
                                              0.0643782172801676, 36.4904799747384, -0.195852342347312, 
                                              0.0962145486567872, 0.0722547833992333, 0.052983985418381
                                              ),
                             intercept.stderror = c(0.66229118393043, 1.65662441796632, 
                                                0.789369553469948, 0.833673014957086, 1.11965730014412, 0.790145647086538, 
                                                1.431954215685, 3.21124050127362, 1.41652735197116, 0.87271447234245, 
                                                0.914854669875221, 1.431954215685, 1.26525679516755, 0.848359111054414, 
                                                0.703719558001864, 0.803704485290518, 0.662379880798868, 
                                                12.5543883737514, 0.669932758331245, 2774.46370100024, 1.07213154210878, 
                                                0.690550563786608, 0.615764407978849, 1.05340271760867), 
                              year.stderror = c(0.0995150124615277, 0.132566423233896, 
                                               0.118845056593527, 0.122441152913946, 0.15823955193126, 0.121915716838618, 
                                               0.203949491797337, 0.569115067435634, 0.198270242835728, 
                                               0.127899223807658, 0.132954541387084, 0.203949491797337, 
                                               0.182041656739027, 0.12734934476106, 0.104353234986022, 0.120974440363535, 
                                               0.0993400015871386, 1.28363767963825, 0.101284703627579, 
                                               346.807997941976, 0.153102029779358, 0.105109786611253, 0.0935870947012417, 
                                               0.157909924089591),
                             intercept.zvalue = c(-1.77887942191882, 
                                                 -1.2829531367259, -2.15316935498853, -1.81606776656163, -1.94429733850312, 
                                                -1.6838914480773, -1.96843735320566, -0.82484828231442, -2.00220994824823, 
                                                -1.80607848926879, -2.08783612129309, -1.96843735320566, 
                                                -1.6884056765115, -2.08982127779059, -1.82423488433382, -2.13622406648812, 
                                                -1.78568613159273, -1.10316608338857, -1.75781750016762, 
                                                -0.105218114655119, -1.72007292354056, -1.73593034848572, 
                                                -1.24988163387586, -2.35040803058929),
                             year.zvalue = c(0.343992823817945, 
                                             0.0846122650783183, 0.606148534367281, -0.996530657650433, 
                                             -0.935330529858395, 1.40995588884549, 0.853756830530071, 
                                             -0.995335693623635, -0.575762185852526, -1.07635254991656, 
                                             -0.644292547341645, 0.853756830530071, -1.38010865033552, 
                                             0.919623712873239, -0.449216388569914, 0.714234189869824, 
                                             0.245117808803707, -0.199411554355625, 0.635616386032825, 
                                             0.105218103940162, -1.27922760155148, 0.915371934039169, 
                                             0.772059263404772, 0.335532967442377),
                             intercept.pvalue = c(0.07525953250101, 0.199508494901557, 0.0313053711560582, 0.0693599775144547, 
                                                 0.0518596054264458, 0.0922026493889603, 0.0490177375929778, 
                                                 0.409457731238072, 0.0452621561999708, 0.070906080305768, 
                                                 0.0368126199963619, 0.0490177375929778, 0.0913333815550908, 
                                                 0.0366338572367188, 0.0681165698628925, 0.0326611547082257, 
                                                 0.0741500921017838, 0.269955047232846, 0.0787785666955547, 
                                                 0.916202737090794, 0.0854191868133481, 0.0825761508869597, 
                                                 0.211342789461164, 0.0187528413234339),
                             year.pvalue = c(0.730851682908968, 0.932569647915748, 0.544416124543929, 0.318992378861951, 
                                             0.349617986309252, 0.158552708321573, 0.393239738289503, 
                                             0.319573023285896, 0.564775936133011, 0.281769614946285, 
                                             0.51938574744968, 0.393239738289503, 0.167553194271885, 0.357769430607515, 
                                             0.653275566248193, 0.47508237862208, 0.806365214045797, 0.841940822917499, 
                                             0.525026486651066, 0.916202745592899, 0.200816918776191, 
                                             0.359996407127171, 0.440079328037691, 0.737223080155663), 
                             observations = c(3, 2, 2, 3, 2, 3, 1, 5, 1, 3, 2, 1, 3, 2, 
                                              3, 2, 3, 3, 3, 2, 3, 3, 4, 1)),
                             .Names = c("species_name","intercept.estimate", "year.estimate", "intercept.stderror", 
                                     "year.stderror", "intercept.zvalue", "year.zvalue", "intercept.pvalue", 
                                     "year.pvalue", "observations"), 
                             class = "data.frame",
                             row.names = c(NA, 24L),
                            intercept_year = 2013,
                            min_year = -10,
                            max_year = 9,
                            nVisits = 13L,
                            model_formula = "cbind(successes, failures) ~ year + (1|site)",
                            minL = 4,
                            minTP = 3)
  
  expect_equal(object = results, expected = expected)
  
})