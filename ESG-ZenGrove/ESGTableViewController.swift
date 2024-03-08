import UIKit
import CoreData

class ESGTableViewController: UITableViewController {

    var fetchedResultsController: NSFetchedResultsController<ESG>!

     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
        print("viewDidLoad")
        
    }


    func loadMovies() {
        let fetchRequest: NSFetchRequest<ESG> = ESG.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            
            print("here")
        } catch {
            print(error.localizedDescription)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController?.fetchedObjects?.count ?? 0
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ESGTableViewCell
        let esg = fetchedResultsController.object(at: indexPath)
        cell.lbTitle.text = esg.title
        cell.lbPontuation.text = "⭐️ \(esg.pontuation!)"
        cell.lbType.text = esg.type
    
        return cell
    }
    
   
    
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let esg = fetchedResultsController.object(at: indexPath)
            context.delete(esg)
            
            do {
                try context.save()
            } catch{
                print(error.localizedDescription)
            }
            
        }
    }
}

extension ESGTableViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}
