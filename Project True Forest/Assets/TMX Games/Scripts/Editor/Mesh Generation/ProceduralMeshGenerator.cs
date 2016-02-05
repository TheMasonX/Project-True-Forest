using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;

public class ProceduralMeshGenerator : MonoBehaviour
{
	[Header("----- Cone Settings -----")]
	public string icosphereName = "Icosphere";
	public int icosphereSubdivisions = 4;
	public float icosphereRadius = 1f;

	[Header("----- Cone Settings -----")]
	public string coneName = "Cone";
	public float coneHeight = 5f;
	public float coneBottomRadius = .25f;
	public float coneTopRadius = .25f;
	public int coneSides = 8;
	public int coneHeightSegments = 1;
	public Material material;

	[ContextMenu("-----Spawn Cone-----")]
	public void SpawnCone ()
	{
		CreateObject(coneName, transform.position, transform.rotation, 
			CreateConeMesh(coneHeight, coneBottomRadius, coneTopRadius, coneSides, coneHeightSegments));
	}

	[ContextMenu("-----Spawn Icosphere-----")]
	public void SpawnSphere ()
	{
		Mesh newSphere = CreateIcosphere(icosphereSubdivisions, icosphereRadius);
		string path = EditorUtility.SaveFilePanelInProject("Save Sphere", "Sphere", "Asset", "Save Sphere");

		if (path.Length > 0)
		{
			AssetDatabase.CreateAsset(newSphere, path);
		}

		CreateObject(icosphereName, transform.position, transform.rotation, newSphere);
	}

	public void CreateObject (string newName, Vector3 position, Quaternion rotation, Mesh mesh)
	{
		GameObject newObject = new GameObject (newName);
		newObject.transform.position = position;
		newObject.transform.rotation = rotation;
		newObject.AddComponent<MeshFilter>();
		newObject.GetComponent<MeshFilter>().mesh = mesh;

		newObject.AddComponent<MeshRenderer>();
		newObject.GetComponent<MeshRenderer>().material = material;

	}

	public Mesh CreateConeMesh (float height, float bottomRadius, float topRadius, int nbSides, int nbHeightSeg)
	{
		Mesh mesh = new Mesh ();

		int nbVerticesCap = nbSides + 1;
		#region Vertices

		// bottom + top + sides
		Vector3[] vertices = new Vector3[nbVerticesCap + nbVerticesCap + nbSides * (nbHeightSeg + 1) + 2];
		int vert = 0;
		float _2pi = Mathf.PI * 2f;

		// Bottom cap
		vertices[vert++] = new Vector3(0f, 0f, 0f);
		while( vert <= nbSides )
		{
			float rad = (float)vert / nbSides * _2pi;
			vertices[vert] = new Vector3(Mathf.Cos(rad) * bottomRadius, 0f, Mathf.Sin(rad) * bottomRadius);
			vert++;
		}

		// Top cap
		vertices[vert++] = new Vector3(0f, height, 0f);
		while (vert <= nbSides * 2 + 1)
		{
			float rad = (float)(vert - nbSides - 1)  / nbSides * _2pi;
			vertices[vert] = new Vector3(Mathf.Cos(rad) * topRadius, height, Mathf.Sin(rad) * topRadius);
			vert++;
		}

		// Sides
		int v = 0;
		int heightSeg = 0;
		while (vert <= vertices.Length - 4 )
		{
			if(v >= nbSides)
			{
				v = 0;
				heightSeg++;
			}
			float startHeight = (float)heightSeg / (float)nbHeightSeg;
			float endHeight = (float)(heightSeg + 1) / (float)nbHeightSeg;

			float startRad = Mathf.Lerp(bottomRadius, topRadius, startHeight);
			float endRad = Mathf.Lerp(bottomRadius, topRadius, endHeight);

			float rad = (float)v / nbSides * _2pi;
			vertices[vert] = new Vector3(Mathf.Cos(rad) * endRad, endHeight * height, Mathf.Sin(rad) * endRad);
			vertices[vert + 1] = new Vector3(Mathf.Cos(rad) * startRad, startHeight * height, Mathf.Sin(rad) * startRad);
			vert+=2;
			v++;
		}
		vertices[vert] = vertices[ nbSides * 2 + 2 ];
		vertices[vert + 1] = vertices[nbSides * 2 + 3 ];
		#endregion

		#region Normales

		// bottom + top + sides
		Vector3[] normales = new Vector3[vertices.Length];
		vert = 0;

		// Bottom cap
		while( vert  <= nbSides )
		{
			normales[vert++] = Vector3.down;
		}

		// Top cap
		while( vert <= nbSides * 2 + 1 )
		{
			normales[vert++] = Vector3.up;
		}

		// Sides
		v = 0;
		while (vert <= vertices.Length - 4 )
		{
			v = v % nbSides;
			float rad = (float)v / nbSides * _2pi;
			float cos = Mathf.Cos(rad);
			float sin = Mathf.Sin(rad);

			normales[vert] = new Vector3(cos, 0f, sin);

			vert++;
			v++;
		}
		normales[vert] = normales[ nbSides * 2 + 2 ];
		normales[vert + 1] = normales[nbSides * 2 + 3 ];
		#endregion

		#region UVs
		Vector2[] uvs = new Vector2[vertices.Length];

		// Bottom cap
		int u = 0;
		uvs[u++] = new Vector2(0.5f, 0.5f);
		while (u <= nbSides)
		{
			float rad = (float)u / nbSides * _2pi;
			uvs[u] = new Vector2(Mathf.Cos(rad) * .5f + .5f, Mathf.Sin(rad) * .5f + .5f);
			u++;
		}

		// Top cap
		uvs[u++] = new Vector2(0.5f, 0.5f);
		while (u <= nbSides * 2 + 1)
		{
			float rad = (float)u / nbSides * _2pi;
			uvs[u] = new Vector2(Mathf.Cos(rad) * .5f + .5f, Mathf.Sin(rad) * .5f + .5f);
			u++;
		}

		// Sides
		int u_sides = 0;
		int uHeightSeg = 0;
		while (u <= uvs.Length - 4 )
		{
			if(u_sides >= nbSides)
			{
				u_sides = 0;
				uHeightSeg++;
			}
			float startV = (float)uHeightSeg / (float)nbHeightSeg;
			float endV = ((float)uHeightSeg + 1f) / (float)nbHeightSeg;

			float t = (float)u_sides / nbSides;
			uvs[u] = new Vector3(t, endV);
			uvs[u + 1] = new Vector3(t, startV);
			u += 2;
			u_sides++;
		}
		uvs[u] = new Vector2(1f, 1f);
		uvs[u + 1] = new Vector2(1f, 0f);
		#endregion 

		#region Triangles
		int nbTriangles = nbSides * nbHeightSeg + nbSides + nbSides*2;
		int[] triangles = new int[nbTriangles * 3 + 3];

		// Bottom cap
		int tri = 0;
		int i = 0;
		while (tri < nbSides - 1)
		{
			triangles[ i ] = 0;
			triangles[ i+1 ] = tri + 1;
			triangles[ i+2 ] = tri + 2;
			tri++;
			i += 3;
		}
		triangles[i] = 0;
		triangles[i + 1] = tri + 1;
		triangles[i + 2] = 1;
		tri++;
		i += 3;

		// Top cap
		//tri++;
		while (tri < nbSides*2)
		{
			triangles[ i ] = tri + 2;
			triangles[i + 1] = tri + 1;
			triangles[i + 2] = nbVerticesCap;
			tri++;
			i += 3;
		}

		triangles[i] = nbVerticesCap + 1;
		triangles[i + 1] = tri + 1;
		triangles[i + 2] = nbVerticesCap;		
		tri++;
		i += 3;
		tri++;

		// Sides
		while( tri <= nbTriangles )
		{
			triangles[ i ] = tri + 2;
			triangles[ i+1 ] = tri + 1;
			triangles[ i+2 ] = tri + 0;
			tri++;
			i += 3;

			triangles[ i ] = tri + 1;
			triangles[ i+1 ] = tri + 2;
			triangles[ i+2 ] = tri + 0;
			tri++;
			i += 3;
		}
		#endregion

		mesh.vertices = vertices;
		mesh.normals = normales;
		mesh.uv = uvs;
		mesh.triangles = triangles;

		mesh.RecalculateBounds();
		mesh.Optimize();

		return mesh;
	}

	private struct TriangleIndices
	{
		public int v1;
		public int v2;
		public int v3;

		public TriangleIndices(int v1, int v2, int v3)
		{
			this.v1 = v1;
			this.v2 = v2;
			this.v3 = v3;
		}
	}

	// return index of point in the middle of p1 and p2
	private static int getMiddlePoint(int p1, int p2, ref List<Vector3> vertices, ref Dictionary<long, int> cache, float radius)
	{
		// first check if we have it already
		bool firstIsSmaller = p1 < p2;
		long smallerIndex = firstIsSmaller ? p1 : p2;
		long greaterIndex = firstIsSmaller ? p2 : p1;
		long key = (smallerIndex << 32) + greaterIndex;

		int ret;
		if (cache.TryGetValue(key, out ret))
		{
			return ret;
		}

		// not in cache, calculate it
		Vector3 point1 = vertices[p1];
		Vector3 point2 = vertices[p2];
		Vector3 middle = new Vector3
			(
				(point1.x + point2.x) / 2f, 
				(point1.y + point2.y) / 2f, 
				(point1.z + point2.z) / 2f
			);

		// add vertex makes sure point is on unit sphere
		int i = vertices.Count;
		vertices.Add( middle.normalized * radius ); 

		// store it, return index
		cache.Add(key, i);

		return i;
	}

	public static Mesh CreateIcosphere (int subdivisions = 3, float radius = 1f)
	{
		Mesh mesh = new Mesh ();
		mesh.name = "Icosphere";

		List<Vector3> vertList = new List<Vector3>();
		Dictionary<long, int> middlePointIndexCache = new Dictionary<long, int>();
		int index = 0;

		// create 12 vertices of a icosahedron
		float t = (1f + Mathf.Sqrt(5f)) / 2f;

		vertList.Add(new Vector3(-1f,  t,  0f).normalized * radius);
		vertList.Add(new Vector3( 1f,  t,  0f).normalized * radius);
		vertList.Add(new Vector3(-1f, -t,  0f).normalized * radius);
		vertList.Add(new Vector3( 1f, -t,  0f).normalized * radius);

		vertList.Add(new Vector3( 0f, -1f,  t).normalized * radius);
		vertList.Add(new Vector3( 0f,  1f,  t).normalized * radius);
		vertList.Add(new Vector3( 0f, -1f, -t).normalized * radius);
		vertList.Add(new Vector3( 0f,  1f, -t).normalized * radius);

		vertList.Add(new Vector3( t,  0f, -1f).normalized * radius);
		vertList.Add(new Vector3( t,  0f,  1f).normalized * radius);
		vertList.Add(new Vector3(-t,  0f, -1f).normalized * radius);
		vertList.Add(new Vector3(-t,  0f,  1f).normalized * radius);


		// create 20 triangles of the icosahedron
		List<TriangleIndices> faces = new List<TriangleIndices>();

		// 5 faces around point 0
		faces.Add(new TriangleIndices(0, 11, 5));
		faces.Add(new TriangleIndices(0, 5, 1));
		faces.Add(new TriangleIndices(0, 1, 7));
		faces.Add(new TriangleIndices(0, 7, 10));
		faces.Add(new TriangleIndices(0, 10, 11));

		// 5 adjacent faces 
		faces.Add(new TriangleIndices(1, 5, 9));
		faces.Add(new TriangleIndices(5, 11, 4));
		faces.Add(new TriangleIndices(11, 10, 2));
		faces.Add(new TriangleIndices(10, 7, 6));
		faces.Add(new TriangleIndices(7, 1, 8));

		// 5 faces around point 3
		faces.Add(new TriangleIndices(3, 9, 4));
		faces.Add(new TriangleIndices(3, 4, 2));
		faces.Add(new TriangleIndices(3, 2, 6));
		faces.Add(new TriangleIndices(3, 6, 8));
		faces.Add(new TriangleIndices(3, 8, 9));

		// 5 adjacent faces 
		faces.Add(new TriangleIndices(4, 9, 5));
		faces.Add(new TriangleIndices(2, 4, 11));
		faces.Add(new TriangleIndices(6, 2, 10));
		faces.Add(new TriangleIndices(8, 6, 7));
		faces.Add(new TriangleIndices(9, 8, 1));


		// refine triangles
		for (int i = 0; i < subdivisions; i++)
		{
			List<TriangleIndices> faces2 = new List<TriangleIndices>();
			foreach (var tri in faces)
			{
				// replace triangle by 4 triangles
				int a = getMiddlePoint(tri.v1, tri.v2, ref vertList, ref middlePointIndexCache, radius);
				int b = getMiddlePoint(tri.v2, tri.v3, ref vertList, ref middlePointIndexCache, radius);
				int c = getMiddlePoint(tri.v3, tri.v1, ref vertList, ref middlePointIndexCache, radius);

				faces2.Add(new TriangleIndices(tri.v1, a, c));
				faces2.Add(new TriangleIndices(tri.v2, b, a));
				faces2.Add(new TriangleIndices(tri.v3, c, b));
				faces2.Add(new TriangleIndices(a, b, c));
			}
			faces = faces2;
		}

		mesh.vertices = vertList.ToArray();

		List< int > triList = new List<int>();
		for( int i = 0; i < faces.Count; i++ )
		{
			triList.Add( faces[i].v1 );
			triList.Add( faces[i].v2 );
			triList.Add( faces[i].v3 );
		}		
		mesh.triangles = triList.ToArray();

		Vector2[] uv = new Vector2[ vertList.Count ];
		Vector3[] normals = new Vector3[ vertList.Count];
		for (int i = 0; i < normals.Length; i++)
		{
			normals[i] = vertList[i].normalized;
//			uv[i] = new Vector2( .25f + Mathf.Clamp01(((Mathf.Atan2(-normals[i].z, -normals[i].x) / Mathf.PI) + 1f) / 2f), -(0.5f-(Mathf.Asin(normals[i].y)/Mathf.PI)) );
			uv[i] = new Vector2(Mathf.Clamp01(((Mathf.Atan2(Mathf.Abs(normals[i].z), -normals[i].x) / Mathf.PI) + 1f) / 2f), -(0.5f-(Mathf.Asin(normals[i].y)/Mathf.PI)) );
		}


		mesh.normals = normals;
		mesh.uv = uv;

		mesh.RecalculateBounds();
		mesh.Optimize();

		return mesh;
	}
}
