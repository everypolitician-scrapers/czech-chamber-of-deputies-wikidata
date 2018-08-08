#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

sparq = 'SELECT ?item WHERE { ?item p:P39/ps:P39 wd:Q19803234 }'
ids = EveryPolitician::Wikidata.sparql(sparq)

pages = [
  'Kategorie:Poslanci_Parlamentu_České_republiky_(2013–2017)',
  'Kategorie:Poslanci_Parlamentu_České_republiky_(2010–2013)',
  'Kategorie:Poslanci_Parlamentu_České_republiky_(2006–2010)',
  'Kategorie:Poslanci_Parlamentu_České_republiky_(2002–2006)',
  'Kategorie:Poslanci_Parlamentu_České_republiky_(1998–2002)',
  'Kategorie:Poslanci_Parlamentu_České_republiky_(1996–1998)',
  'Kategorie:Poslanci_Parlamentu_České_republiky_(1992–1996)',
]

names = pages.map { |c| WikiData::Category.new(c, 'cs').member_titles }.flatten.uniq
EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { cs: names })
