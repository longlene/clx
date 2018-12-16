# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Ruby-Processing is a ruby wrapper for the processing-2"
HOMEPAGE="http://wiki.github.com/jashkenas/ruby-processing"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.10"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.9"
ruby_add_rdepend ">=dev-ruby/minitest-5.8"

