# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Haml (HTML Abstraction Markup Language) is a layer on top of HTML or XML that's
designed to express the structure of documents in a non-repetitive, elegant, and
easy way by using indentation rather than closing tags and allowing Ruby to be
embedded with ease"
HOMEPAGE="http://haml.info/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/temple-0.8.0"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/rbench-0"
ruby_add_rdepend ">=dev-ruby/minitest-4.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"

