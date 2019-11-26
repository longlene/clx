# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="dump headers, sections, extract resources of win32 PE exe,dll,etc"
HOMEPAGE="http://github.com/zed-0xff/pedump"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/iostruct-0.0.4"
ruby_add_rdepend ">=dev-ruby/multipart-post-2.0.0"
ruby_add_rdepend ">=dev-ruby/progressbar-0"
ruby_add_rdepend ">=dev-ruby/zhexdump-0.0.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

