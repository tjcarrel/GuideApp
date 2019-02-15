# GuideApp
The problem was to fetch JSON data from an endpoint, parse the data into an array of objects of class `Guide`, and then display the array of objects in a UITableView where they are seperated by the attribute `startDate`. 

My solution includes creating a collection of classes in order to easily fetch the JSON data and parse it into classes. The classes adopt the Codable protocol for this reason, and are created to mimic the structure of the JSON data being fetched. In `NetworkManager.swift`, the data is fetched and parsed into the classes for manipulation. The objects are then sorted into objects of type `DateSection`, which contains a specified `startDate` and an array of objects of type `Guide` that share that `startDate` attribute value. This class adopts the `Comparable` protocol, allowing one to easily sort the `startDate` attribute in ascending order for viewing in the UITableView. 

Once all the data is fetched and sorted appropriately, it is displayed in a UITableView in `GuideViewController`. That file is in charge of instantiating the UITableView and conforms to both `UITableViewDataSource` and `UITableViewDelegate`. A custom cell class called `GuideTableViewCell` was created in order to create a UITableViewCell that displays the necessary information. The SnapKit pod was used to easily and efficiently programmatically layout all necessary UIViews within the app. 

Despite not being shown, there is a label for each cell to display the location of each guide object. However at the time of the screenshot, there was no venue data for any guide in the JSON data. In addition, the title displays the number of guides, which was fetched from the `total` field of the JSON data. However, the JSON does not include that many guide objects.

If I were to spend more time on the project, I would redesign the look of the UITableView and its cells to make it look less like a traditional UITableView. Additionally, I would add the option to click on a cell and present a modal view controller which would display the guide's additional data, including the icon. 

## Sreenshot 

<img src=https://github.com/tjcarrel/GuideApp/blob/master/Screenshot.png  width=290 />
