# Import HappyX
import
  happyx,
  components/[hello_world]

# Declare application with ID "app"
appRoutes("app"):
  "/":
    # Component usage
    component HelloWorld
