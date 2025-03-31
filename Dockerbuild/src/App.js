import './App.css';
import React from 'react';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      resources: []
    }

  }

  componentDidMount() {
  
    const allResources =  [
            {
                "Id": "095a6d7f-4893-4a3b-9c35-ff595d4bfa0c",
                "Name": "208",
                "State": "Dirty",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "2",
                        "LocationNotes": "1"
                    }
                }
            },
            {
                "Id": "0943f364-491f-4590-a207-fc92dc9ab92e",
                "Name": "107",
                "State": "DoNotDisturb",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "1",
                        "LocationNotes": null
                    }
                }
            },
            {
                "Id": "eeb095d1-e8ed-40e9-9b4f-f5a91bf85bc4",
                "Name": "810",
                "State": "Dirty",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "8",
                        "LocationNotes": null
                    }
                }
            },
            {
                "Id": "731aaefd-1f84-47cb-858a-ef701f6a375a",
                "Name": "108",
                "State": "Dirty",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "1",
                        "LocationNotes": ""
                    }
                }
            },
            {
                "Id": "ec06ad34-be1a-40f9-b934-dc7b561d2f12",
                "Name": "309",
                "State": "Clean",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "3",
                        "LocationNotes": null
                    }
                }
            },
            {
                "Id": "359fecf8-2bd3-4bdb-ada7-d2a2e6ae661c",
                "Name": "802",
                "State": "Clean",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "8",
                        "LocationNotes": "2"
                    }
                }
            },
            {
                "Id": "6f8bdb5b-86ad-47c2-8378-d14350a38eaa",
                "Name": "407",
                "State": "Dirty",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "4",
                        "LocationNotes": "0506"
                    }
                }
            },
            {
                "Id": "baade5a4-9dd9-43b2-90d8-c936c115bc99",
                "Name": "116",
                "State": "Dirty",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "8",
                        "LocationNotes": null
                    }
                }
            },
            {
                "Id": "5ee074b1-6c86-48e8-915f-c7aa4702086f",
                "Name": "0101",
                "State": "DoNotDisturb",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "1",
                        "LocationNotes": "A1"
                    }
                }
            },
            {
                "Id": "9868b6d9-1e6d-4e85-a64a-b731628a0da2",
                "Name": "203",
                "State": "Dirty",
                "Data": {
                    "Discriminator": "Space",
                    "Value": {
                        "FloorNumber": "2",
                        "LocationNotes": null
                    }
                }
            }
        ];
    

    this.setState({ resources: allResources });
    
  }

  render() {
    const { resources } = this.state;
    { console.log(resources) }
    return (
      <div className="App">
        <header className="App-header">
        <table className="trial-data">
          <thead>
            <tr><th>Room Number</th>
                <th>Floor Number</th>
                <th>Room Status</th></tr></thead>
              <tbody>
              {resources.map(resource => (
                      <tr key={resource.Name}><td>{resource.Name}</td>
                          <td>{resource.Data.Value.FloorNumber}</td>
                          <td>{resource.State}</td>
                      </tr>
                  ))}
            </tbody>
          </table>
        </header>
      </div>
    );
  };
}

export default App;
