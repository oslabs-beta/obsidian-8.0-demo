// react
import * as React from "https://esm.sh/react@18";
import * as ReactDOM from "https://esm.sh/react-dom@18";
import * as ReactDOMServer from "https://esm.sh/react-dom@18/server?dev";

import {
  BrowserRouter,
  Link,
  Navigate,
  Route,
  Routes,
  useParams,
} from "https://esm.sh/react-router-dom@6.3.0?deps=react@18";

//import { ObsidianWrapper, useObsidian, BrowserCache } from 'https://deno.land/x/obsidian/clientMod.ts';
import { ObsidianWrapper, useObsidian, BrowserCache, LFUCache } from '../obsidian-8.0/clientMod.ts';

export { 
  React,
  ReactDOM,
  ReactDOMServer,
  BrowserRouter,
  Link,
  Navigate,
  Route,
  Routes,
  useParams,
  ObsidianWrapper,
  useObsidian,
  BrowserCache,
  LFUCache
};
