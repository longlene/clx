# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="58843c4c43f618469f624bc135fba742984c227c"

DESCRIPTION="Formatted C++17 stdlib man pages"
HOMEPAGE="https://github.com/jeaye/stdman"
SRC_URI="https://github.com/jeaye/stdman/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	:
}

src_install() {
	local m
	for m in adjacent_difference adjacent_find advance align align_val_t aligned_alloc aligned_storage aligned_union alignment_of alignment_of allocate_shared allocator any apply array atexit atof atomic auto_ptr bad_cast exception basic_regex begin bind bitset call_once clock codecvt complex condition_variable ctime ctype deque empty end endl error_code exp fclose feof ferror fflush fgetpos filebuf filesystem::path filesystem::permissions filesystem::perms fill find flush fopen for_each fread free fseek fstream function future gcd generate getenv getline gets gmtime hash ifstream ignore ios iostream iota is_array is_pod isalnum isalpha isblank iscntrl isdigit isgraph isless istream istringstream list locale lock lock_guard make_any make_optional make_shared make_tuple make_unique malloc map move multimap multiset mutex nothrow numeric_limits ofstream optional ostream packaged_task pair partial_sort partition perror priority_queue promise queue ratio recursive_mutex recursive_timed_mutex reduce regex regex_match regex_replace regex_search regex_traits remove rename result_of reverse scoped_lock search set shared_future shared_lock shared_mutex shared_ptr signal slice slice_array stack streambuf string stringbuf stringstream swap system thread tie time time_get time_put time_t timespec tm to_string transform tuple type_info unique unique_ptr unordered_map va_list valarray variant vector void_t weak_ptr ; do
		doman man/std::${m}.3
	done
	dodoc README.md
}
