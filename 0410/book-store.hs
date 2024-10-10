module BookStore where

    type CustomerId = Int
    type ReviewBody = String
    type CardHolder = String
    type CardNumber = String
    type Address    = [String]

    data Book = Book Int String [String]
                deriving (Show)

    data Magazine = Magazine Int String [String]
                    deriving (Show)

    data BookReview = BookReview Book CustomerId ReviewBody
                      deriving (Show)

    data BillingInfo = CreditCard CardNumber CardHolder Address
                     | CashOnDelivery
                     | Invoice CustomerId
                     deriving (Show)

