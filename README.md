# Restaurant

### Maria owns a restaurant that increasingly becomes more popular.
### She is looking to improve her services through an IT solution.
### She is thinking about a KDS(Kitchen Display System) that enables her and her waiters to send an order directly to the appropriate workspace.
### She organised her restaurant using the following workspaces:
- bar - for drinks and coffee
- deserts - a smaller deserts kitchen
- main - main kitchen where meals are prepared

#### Keep in mind that if Maria is content with her IT solution she will be eager to recomend it to other restaurant owners.

## KDS system

- Below are a few entities that will be used throughout our application. Next to them are the fields and a few hints about that field. Implement the following entities as clases.
    - Product
        - id
        - price
        - name
    - Menu
        - id,
        - productList,
        - name(ex: Main menu, Drinks Menu)
    - Employee (with reference to a waiter)
        - id
        - firstName
        - lastName
    - Table
        - id
        - name (ex:terasa1,interior1)
    - OrderItem
        - id
        - idProduct
        - idOrder
    - Order
        - id
        - idTable
        - status(NEW, IN_PROGRESS, DONE)
        - idWorkspace
    - Workspace
        - id
        - name