import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/common/common.dart';
import 'package:portfolio/data/models/project_data.dart';
import 'package:portfolio/data/models/resume_file.dart';

class FirestoreDb {
  final String? uid;
  FirestoreDb({
    this.uid,
  });

  final instance = FirebaseFirestore.instance;

  final CollectionReference projectCollection =
      FirebaseFirestore.instance.collection('projects');
  final CollectionReference resumeCollection =
      FirebaseFirestore.instance.collection('resume');

  Future<List<ProjectData>> getProjectByCategories(String categoryId) async {
    return await projectCollection
        .where('categories', arrayContains: categoryId)
        .orderBy('rating', descending: true)
        .get()
        .then((value) => value.docs.map((e) {
              Map<String, dynamic> data = e.data() as Map<String, dynamic>;
              return ProjectData.fromMap(data);
            }).toList());
  }

  Future<ResumeFile> getLatestResume() async {
    return await resumeCollection
        .orderBy('version', descending: true)
        .get()
        .then((e) {
      Map<String, dynamic> data = e.docs.first.data() as Map<String, dynamic>;
      return ResumeFile.fromMap(data);
    });
  }

  Future testData() async {
    return await projectCollection.get().then((value) => value.docs.map((e) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          //print(ProjectData.fromMap(data));
          return ProjectData.fromMap(data);
        }).toList());
  }

  // Future testGetData() async {
  //   return projectCollection
  //       .where('categories', arrayContains: "All")
  //       .get()
  //       .then((value) {
  //     return value.docs.;
  //   });
  // }

  Future<DocumentReference> addProjects(ProjectData projectData) async {
    return await projectCollection.add(projectData.toMap());
  }

  Future updateProjectsImage(String uid, List<String> imageUrl) async {
    return await projectCollection.doc(uid).update({"imageUrl": imageUrl});
  }

  Future<int> getProjectPage(ProjCategory category) {
    return projectCollection
        .where('categories', arrayContains: category.text)
        .count()
        .get()
        .then((value) => value.count);
  }
}
