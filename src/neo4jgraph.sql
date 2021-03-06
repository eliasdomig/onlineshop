CREATE (NAmerica:Location {name:'North America', type:'continent'})
CREATE (Europe:Location {name:'Europe', type:'continent'})
CREATE (USA:Location {name:'United States', type:'country'})
CREATE (UK:Location {name:'United Kingdom', type:'country'})
CREATE (England:Location {name:'England', type:'country'})
CREATE (Austria:Location {name:'Österreich', type:'country'})
CREATE (Idaho:Location {name:'Idaho', type:'state'})
CREATE (London:Location {name:'London', type:'city'})
CREATE (UpperAustria:Location {name:'Oberösterreich', type:'Bundesland'})
CREATE (Waldviertel:Location {name:'Waldviertel', type:'Viertel'})
CREATE (Grein:Location {name:'Grein', type:'city'})
CREATE (Andrea:Person {name:'Andrea', type:'person'})
CREATE (Bert:Person {name:'Bert', type:'person'})
CREATE (Christian:Person {name:'Christian', type:'person'})
CREATE (Idaho) -[:WITHIN]-> (NAmerica)
CREATE (UK) -[:WITHIN]-> (Europe)
CREATE (England) -[:WITHIN]-> (UK)
CREATE (Austria) -[:WITHIN]-> (Europe)
CREATE (Idaho) -[:WITHIN]-> (USA)
CREATE (London) -[:WITHIN]-> (England)
CREATE (UpperAustria) -[:WITHIN]-> (Austria)
CREATE (Waldviertel) -[:WITHIN]-> (UpperAustria)
CREATE (Grein) -[:WITHIN]-> (Waldviertel)
CREATE (Andrea) -[:BORN_IN]-> (Idaho)
CREATE (Andrea) -[:LIVES_IN]-> (London)
CREATE (Bert) -[:BORN_IN]-> (Grein)
CREATE (Bert) -[:LIVES_IN]-> (London)
CREATE (Christian) -[:BORN_IN]-> (London)
CREATE (Christian) -[:LIVES_IN]-> (London)
CREATE (Andrea) -[:MARRIED_TO]-> (Bert)
CREATE (Bert) -[:MARRIED_TO]-> (Andrea)
MATCH (person)-[:BORN_IN]->()-[WITHIN*0..]->(us:Location {name:'United States'}), (person)-[:LIVES_IN]->()-[:WITHIN*0..]->(eu:Location {name:'Europe'}) RETURN person.name