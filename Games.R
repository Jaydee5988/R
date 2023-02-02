# Coup card game


deck <- c("Duke", "Assassin", "Captin", "Ambassador", "Contessa")
print(deck)

hand <- sample(deck, size = 3, replace = TRUE)
print(hand)

draw <- function(){
  deck <- c("Duke", "Assassin", "Captin", "Ambassador", "Contessa")
  hand <- sample(deck, size = 3, replace = TRUE)
  print(hand)
}
draw()

# Flip a Coin
flip <- function(){
  coin <- c("Heads", "Tails")
  land <- sample(coin, size = 100, replace = TRUE, prob = c(0.3, 0.7))
  print(land)
}
flip()
