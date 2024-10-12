module Penultimate (penultimate) where
    penultimate xs = last (init xs)
