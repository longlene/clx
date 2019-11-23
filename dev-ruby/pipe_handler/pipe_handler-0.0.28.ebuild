# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    This library is called pipe_handler"
HOMEPAGE="https://github.com/shevegen/pipe_handler"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/coderay-0"
ruby_add_rdepend ">=dev-ruby/crop-0"
ruby_add_rdepend ">=dev-ruby/extracter-0"
ruby_add_rdepend ">=dev-ruby/file_duration-0"
ruby_add_rdepend ">=dev-ruby/konsole-0"
ruby_add_rdepend ">=dev-ruby/wget_wrapper-0"
ruby_add_rdepend ">=dev-ruby/remove_comments-0"
ruby_add_rdepend ">=dev-ruby/extract_audio-0"
ruby_add_rdepend ">=dev-ruby/save_file-0"
ruby_add_rdepend ">=dev-ruby/stat_file-0"
ruby_add_rdepend ">=dev-ruby/multimedia_paradise-0"
ruby_add_rdepend ">=dev-ruby/ftp_paradise-0"
ruby_add_rdepend ">=dev-ruby/prawn-0"
ruby_add_rdepend ">=dev-ruby/bioroebe-0"

