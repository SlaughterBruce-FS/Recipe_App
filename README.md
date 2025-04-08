### ✅ Focus Areas

I prioritized building a clean, scalable architecture using the MVVVM pattern, along with ensuring a smooth user experience through efficient data loading and error handling. My main focus was:

- **Code organization and modularity** to allow for easier testing and future maintenance.
- **Networking and caching logic**, as efficient data management is crucial in most production-grade apps.

I chose to prioritize the logic and functionality of the application, focusing on writing clean, maintainable code to demonstrate my development skills. Rather than spending significant time on the UI, I concentrated on building a fully functional app prototype. A key part of my approach was designing a scalable architecture that can support future growth.

---

### ⏱ Time Spent

I spent approximately **5 hours** on this project. Time was allocated as follows:

- **Initial setup and architecture**: 1 hours  
- **Networking, parsing, and caching**: 2 hours  
- **UI implementation and state handling**: 1 hours  
- **Testing and debugging**: 1 hours  


---

### ⚖️ Trade-offs and Decisions


Another decision was using in-memory caching via `NSCache`, which keeps things performant but doesn't persist data across app launches. For a production scenario, disk caching or Core Data might be more appropriate.


---

### ℹ️ Additional Information

I implemented dependency injection for services to ensure they are initialized only once, which also facilitates testing by allowing the use of mock data. This strategy helped reduce the number of unnecessary API calls during development and made it easier to run unit tests.

During testing, I noticed that images were being re-fetched each time I scrolled back up, which led me to implement image caching. Once an image is loaded, it is now cached to prevent repeated API requests. As for the API data, since it primarily returned a single page and used the same URL, I decided to cache the entire response when a repeated request is made.

I also added filtering functionality based on cuisine type and implemented a search feature that allows users to find meals by name.

In total, I spent about five hours on the project, most of which was dedicated to coding, debugging, and refactoring.

I chose to use in-memory caching rather than persistent storage on the device, as the data could change between app sessions. Typically, I cache detailed data to avoid additional API calls, but since this API didn’t include detailed views, determining what to cache was a challenge and may be the weakest aspect of this project.

Given more time, I would have improved the codebase further—particularly by creating a more reusable, generic API fetching method. Additionally, I would have enhanced the UI by including a detailed view with a larger image, meal name, cuisine type, a link to the source, and possibly embedding the video directly within the app.
