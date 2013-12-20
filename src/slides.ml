(*
 * Copyright (c) 2013 Richard Mortier <mort@cantab.net>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

open Mirage_types.V1
open Cohttp
open Cow

module Deck = struct
  module Date = struct

    type t = {
      year: int;
      month: int;
      day: int;
    } with xml

    let t (year, month, day) = { year; month; day }

    let to_html d =
      let xml_of_month m =
        let str = match m with
          | 1  -> "Jan" | 2  -> "Feb" | 3  -> "Mar" | 4  -> "Apr"
          | 5  -> "May" | 6  -> "Jun" | 7  -> "Jul" | 8  -> "Aug"
          | 9  -> "Sep" | 10 -> "Oct" | 11 -> "Nov" | 12 -> "Dec"
          | _  -> "???" in
        <:xml<$str:str$>>
      in
      <:xml<
        <span class="date">
          <span class="month">$xml_of_month d.month$</span>
          <span class="day">$int:d.day$</span>
          <span class="year">$int:d.year$</span>
        </span>
      >>

    let compare {year=ya;month=ma;day=da} {year=yb;month=mb;day=db} =
      match ya - yb with
      | 0 -> (match ma - mb with
          | 0 -> da - db
          | n -> n
        )
      | n -> n

  end

  type t = {
    permalink: string;
    given: Date.t;
    speakers: Atom.author list;
    venue: string;
    title: string;
    assets: string list;
  }

  let compare a b = Date.compare b.given a.given

end

let decks =
  let open Deck in
  [{ permalink = "clweds13";
     given = Date.t (2013, 12, 04);
     speakers = [People.anil];
     venue = "Wednesday Seminar, Cambridge Computer Laboratory";
     title = "MirageOS: a functional library operating system";
     assets = [ "arch2.png";
                "modules1.png";
                "modules2.png";
                "modules3.png"; "packages.png";
                "uniarch1a.png";
                "uniarch1b.png";
                "uniarch1c.png";
                "uniarch1d.png";
                "architecture.png"; "rwo.jpg";
                "block-storage.png"; "architecture-xapi-project.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "cam13";
     given = Date.t (2013, 12, 03);
     speakers = [People.anil];
     venue = "ACS Lecture, Cambridge Computer Laboratory";
     title = "Modular Operating System Construction";
     assets = [ "arch2.png";
                "modules1.png";
                "modules2.png";
                "modules3.png";
                "uniarch1a.png";
                "uniarch1b.png";
                "uniarch1c.png";
                "uniarch1d.png";
                "architecture.png"; "rwo.jpg";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "fb13";
     given = Date.t (2013, 11, 14);
     speakers = [People.anil];
     venue = "Facebook HQ";
     title = "MirageOS: compiling functional library operating systems";
     assets = [ "arch2.png";
                "modules1.png";
                "modules2.png";
                "modules3.png";
                "uniarch1a.png";
                "uniarch1b.png";
                "uniarch1c.png";
                "uniarch1d.png";
                "architecture.png"; "rwo.jpg";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "fop13";
     given = Date.t (2013, 11, 29);
     speakers = [People.mort];
     venue = "FP Lab 2013";
     title = "MirageOS: Tomorrow's Cloud, Today";
     assets = [ "arch2.png";
                "modules1.png";
                "modules2.png";
                "modules3.png";
                "uniarch1a.png";
                "uniarch1b.png";
                "uniarch1c.png";
                "uniarch1d.png";
                "architecture.png"; "rwo.jpg";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "qcon13";
     given = Date.t (2013, 11, 11);
     speakers = [People.anil];
     venue = "QCon 2013";
     title = "MirageOS: developer tools of tomorrow";
     assets = [ "arch2.png";
                "modules1.png";
                "modules2.png";
                "modules3.png";
                "uniarch1a.png";
                "uniarch1b.png";
                "uniarch1c.png";
                "uniarch1d.png";
                "architecture.png"; "rwo.jpg";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "xensummit13";
     given = Date.t (2013, 10, 25);
     speakers = [People.anil; People.jon];
     venue = "XenSummit 2013";
     title = "MirageOS and XAPI 2013 Project Update";
     assets = [ "arch2.png";
                "modules1.png";
                "modules2.png";
                "modules3.png"; "uniarch.png"; "jon-smallbw1.jpg";
                "architecture-xapi-project.png";
                "architecture.png";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "oscon13";
     given = Date.t (2013, 07, 26);
     speakers = [People.mort; People.anil];
     venue = "OSCON 2013";
     title = "Mirage: Extreme Specialisation of Cloud Appliances";
     assets = [ "arch2.png";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "jslondon13";
     given = Date.t (2013, 08, 29);
     speakers = [People.anil];
     venue = "Jane Street London 2013";
     title = "My Other Internet is a Mirage";
     assets = [ "arch2.png";
                "block-storage.png";
                "boot-time.png";
                "cothreads.png";
                "deens-performance.png";
                "dns-all.png";
                "dns-baseline.png";
                "dns-deens.png";
                "green-arrow.png";
                "key-insight.png";
                "kloc.png";
                "memory-model.png";
                "openflow-controller.png";
                "red-arrow.png";
                "scaling-instances.png";
                "specialisation.png";
                "thread-scaling.png";
                "threat-model-dom0.png";
                "threat-model.png";
                "vapps-current.png";
                "vapps-specialised-1.png";
                "vapps-specialised-2.png";
                "vapps-specialised-3.png";
                "zero-copy-io.png";
              ];
   };

   { permalink = "foci13";
     given = Date.t (2013, 08, 12);
     speakers = [People.anil];
     venue = "FOCI 2013";
     title = "Lost in the Edge: Finding Your Way with Signposts";
     assets = [ "nat.png"; "arch.png" ];
   };
  ]

let index ~req ~path =
  let open Cowabloga in
  let content =
    let decks = decks
                |> List.sort Deck.compare
                |> List.map (fun d ->
                    <:html<
                      <li>
                        $Deck.Date.to_html d.Deck.given$
                        <a href="$str:d.Deck.permalink$">
                          $str:d.Deck.title$ ($str:d.Deck.venue$)
                        </a>
                      </li>
                    >>)
    in
    <:html< <ul>$list:decks$</ul> >>
  in
  let title = "openmirage.org | decks" in
  Foundation.(page ~body:(body ~title ~headers:[] ~content))

let deck ~req ~path =
  let open Cowabloga in
  let content =
    <:html< <p>XXX</p> >>
  in
  let title = "openmirage.org | decks" in
  Foundation.(page ~body:(body ~title ~headers:[] ~content))
